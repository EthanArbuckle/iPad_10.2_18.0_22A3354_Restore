@implementation _MPCQueueControllerEnumerator

- (int64_t)mode
{
  return self->_mode;
}

- (_MPCQueueControllerBehaviorMusic)musicBehavior
{
  return (_MPCQueueControllerBehaviorMusic *)objc_loadWeakRetained((id *)&self->_musicBehavior);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setRepeatBoundaryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (_MPCQueueControllerEnumerator)enumeratorWithMusicBehavior:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 startPosition:(id)a6 endPosition:(id)a7
{
  id v11;
  id v12;
  id v13;
  id *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  id v28;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = -[_MPCQueueControllerEnumerator _init]([_MPCQueueControllerEnumerator alloc], "_init");
  objc_storeWeak(v14 + 4, v11);
  v14[5] = (id)a4;
  v14[6] = (id)a5;
  objc_storeStrong(v14 + 8, a6);
  if ((a5 & 8) != 0)
  {
    v14[1] = (id)2;
    if (v12)
    {
      objc_msgSend(v12, "itemIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_"));

      if (v23)
      {
        v14[1] = (id)1;
        v24 = v14[8];
        v14[8] = 0;

      }
      objc_msgSend(v11, "identifierList");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "hasSection:", v26);

      if ((v27 & 1) != 0)
      {
        v21 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v14[1] = (id)1;
    if (v12)
    {
      objc_msgSend(v12, "itemIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("_PLACEHOLDER_AUTOPLAY_"));

      if (v16)
      {
        v14[1] = (id)2;
        v17 = v14[8];
        v14[8] = 0;

      }
      objc_msgSend(v11, "autoPlayIdentifierList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "hasSection:", v19);

      if (v20)
      {
        v21 = 2;
LABEL_12:
        v14[1] = (id)v21;
      }
    }
  }
  v28 = v14[9];
  v14[9] = v13;

  return (_MPCQueueControllerEnumerator *)v14;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MPCQueueControllerEnumerator;
  return -[_MPCQueueControllerEnumerator init](&v3, sel_init);
}

- (id)nextObject
{
  NSEnumerator *enumerator;
  void *v4;

  enumerator = self->_enumerator;
  if (!enumerator)
  {
    -[_MPCQueueControllerEnumerator _buildEnumerator](self, "_buildEnumerator");
    enumerator = self->_enumerator;
  }
  -[NSEnumerator nextObject](enumerator, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[_MPCQueueControllerEnumerator _buildEnumerator](self, "_buildEnumerator");
    -[NSEnumerator nextObject](self->_enumerator, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_isEnumeratingFromRepeatAllBase && objc_msgSend(v4, "entryType") == 3)
    self->_hasEmittedItemFromRepeatAllBase = 1;
  return v4;
}

- (void)_buildEnumerator
{
  MPSectionedIdentifierListPosition *v3;
  MPSectionedIdentifierListPosition *v4;
  id WeakRetained;
  void *v6;
  MPSectionedIdentifierListPosition *v7;
  MPSectionedIdentifierListPosition *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  MPSectionedIdentifierListPosition *startPosition;
  MPSectionedIdentifierListPosition *endPosition;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void (**repeatBoundaryBlock)(void);
  void *v23;
  void *v24;
  uint64_t v25;
  _MPCAutoPlayEnumerationResult *v26;
  _MPCAutoPlayEnumerationResult *v27;
  void *v28;
  NSEnumerator *v29;
  NSEnumerator *enumerator;
  void *v31;
  MPSectionedIdentifierListPosition *v32;
  char v33;
  MPSectionedIdentifierListPosition *v34;
  void *v35;
  char v36;
  NSEnumerator *v37;
  NSEnumerator *v38;
  MPSectionedIdentifierListPosition *v39;
  MPSectionedIdentifierListPosition *v40;
  unint64_t options;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v3 = self->_startPosition;
  v4 = self->_endPosition;
  options = self->_options;
  WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehavior);
  if (objc_msgSend(WeakRetained, "autoPlayEnabled") && objc_msgSend(WeakRetained, "repeatType") != 2)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "latestUpNextSectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(WeakRetained, "autoPlayIdentifierList");
      v7 = v4;
      v8 = v3;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "latestUpNextSectionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "hasSection:", v10);

      v3 = v8;
      v4 = v7;
    }
    else
    {
      v11 = 0;
    }

  }
  switch(self->_nextEnumerator)
  {
    case 0:
      goto LABEL_57;
    case 1:
      v39 = v3;
      self->_nextEnumerator = 0;
      if ((self->_options & 8) == 0)
      {
        if (((v12 = objc_msgSend(WeakRetained, "repeatType"), (objc_msgSend(WeakRetained, "autoPlayEnabled") & 1) != 0)
           || (objc_msgSend(WeakRetained, "autoPlayEndPosition"),
               v13 = (void *)objc_claimAutoreleasedReturnValue(),
               v13,
               v13))
          && !v12
          || (!self->_mode ? (v14 = 1) : (v14 = v11), v14 == 1))
        {
          self->_nextEnumerator = 2;
        }
      }
      if ((self->_mode & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v15 = objc_msgSend(WeakRetained, "repeatType");
        if (!self->_nextEnumerator && v15 == 2)
        {
          self->_nextEnumerator = 3;
          startPosition = self->_startPosition;
          self->_startPosition = 0;

          endPosition = self->_endPosition;
          self->_endPosition = 0;

        }
      }
      self->_isEnumeratingFromRepeatAllBase = 0;
      objc_msgSend(WeakRetained, "identifierList", v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v40;
      goto LABEL_44;
    case 2:
      if ((self->_options & 8) != 0)
      {
        if (!v3)
        {
          if (v11)
          {
            v23 = (void *)MEMORY[0x24BDDCBC0];
            objc_msgSend(WeakRetained, "latestUpNextSectionID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "positionForTailOfSection:", v24);
            v3 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(WeakRetained, "autoPlayEndPosition");
            v3 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();
          }
        }
        v21 = 1;
      }
      else
      {
        if (v4)
        {
LABEL_27:
          v21 = 0;
          goto LABEL_38;
        }
        if (v11)
        {
          v19 = (void *)MEMORY[0x24BDDCBC0];
          objc_msgSend(WeakRetained, "latestUpNextSectionID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "positionForTailOfSection:", v20);
          v4 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
        objc_msgSend(WeakRetained, "autoPlayEndPosition");
        v4 = (MPSectionedIdentifierListPosition *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        options |= 0x40uLL;
      }
LABEL_38:
      self->_nextEnumerator = v21;
      self->_isEnumeratingFromRepeatAllBase = 0;
      objc_msgSend(WeakRetained, "autoPlayIdentifierList");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v18 = (void *)v25;
      }
      else
      {
        if (objc_msgSend(WeakRetained, "autoPlayState") == 9 && self->_mode)
        {
          v26 = [_MPCAutoPlayEnumerationResult alloc];
          objc_msgSend(WeakRetained, "sessionID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[_MPCAutoPlayEnumerationResult initWithSectionIdentifier:](v26, "initWithSectionIdentifier:", v18);
          v42[0] = v27;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectEnumerator");
          v29 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
          enumerator = self->_enumerator;
          self->_enumerator = v29;

          goto LABEL_56;
        }
LABEL_43:
        v18 = 0;
      }
LABEL_44:
      if (!v3)
        goto LABEL_47;
      -[MPSectionedIdentifierListPosition sectionIdentifier](v3, "sectionIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      v33 = objc_msgSend(v18, "hasSection:", v31);

      if ((v33 & 1) == 0)
      {

        v3 = 0;
        if (!v4)
          goto LABEL_53;
        goto LABEL_50;
      }
      v3 = v32;
LABEL_47:
      if (v4)
      {
LABEL_50:
        v34 = v3;
        -[MPSectionedIdentifierListPosition sectionIdentifier](v4, "sectionIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v18, "hasSection:", v35);

        if ((v36 & 1) == 0)
        {

          v4 = 0;
        }
        v3 = v34;
      }
LABEL_53:
      if (-[MPSectionedIdentifierListPosition isEqual:](v3, "isEqual:", v4))
      {
        self->_nextEnumerator = 0;
      }
      else
      {
        objc_msgSend(v18, "enumeratorWithOptions:startPosition:endPosition:", options, v3, v4);
        v37 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
        v38 = self->_enumerator;
        self->_enumerator = v37;

      }
LABEL_56:

LABEL_57:
      return;
    case 3:
      if (self->_isEnumeratingFromRepeatAllBase && !self->_hasEmittedItemFromRepeatAllBase)
        goto LABEL_57;
      self->_isEnumeratingFromRepeatAllBase = 1;
      objc_msgSend(WeakRetained, "identifierList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      repeatBoundaryBlock = (void (**)(void))self->_repeatBoundaryBlock;
      if (repeatBoundaryBlock)
        repeatBoundaryBlock[2]();
      goto LABEL_44;
    default:
      goto LABEL_43;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPosition, 0);
  objc_storeStrong((id *)&self->_startPosition, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_destroyWeak((id *)&self->_musicBehavior);
  objc_storeStrong(&self->_repeatBoundaryBlock, 0);
}

- (id)repeatBoundaryBlock
{
  return self->_repeatBoundaryBlock;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (MPSectionedIdentifierListPosition)startPosition
{
  return self->_startPosition;
}

- (MPSectionedIdentifierListPosition)endPosition
{
  return self->_endPosition;
}

@end
