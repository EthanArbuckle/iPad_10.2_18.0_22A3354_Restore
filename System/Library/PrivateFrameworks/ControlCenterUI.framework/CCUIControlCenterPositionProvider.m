@implementation CCUIControlCenterPositionProvider

- (id)_generateRectByIdentifierWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4 packingOrder:(unint64_t)a5 startPosition:(CCUILayoutPoint)a6 maximumSize:(CCUILayoutSize)a7 outputLayoutSize:(CCUILayoutSize *)a8
{
  unint64_t var1;
  unint64_t var0;
  id v12;
  unint64_t v13;
  unint64_t height;
  unint64_t width;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  id v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _QWORD v64[5];

  var1 = a6.var1;
  var0 = a6.var0;
  v12 = a3;
  v51 = a4;
  v59 = a5;
  if (a5 == 1)
    v13 = var1;
  else
    v13 = var0;
  v54 = v13;
  if (a5 == 1)
  {
    var1 = var0;
    height = a7.height;
  }
  else
  {
    height = a7.width;
  }
  if (a5 == 1)
    width = a7.width;
  else
    width = a7.height;
  v48 = width;
  v49 = height;
  v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v17 = 0;
    v58 = var1;
    v46 = var1;
    v47 = v12;
    while (2)
    {
      objc_msgSend(v12, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v17;
      objc_msgSend(v51, "objectAtIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "ccui_sizeValue");
      if (v59 == 1)
        v22 = v21;
      else
        v22 = v20;
      v55 = v21;
      v56 = v20;
      if (v59 == 1)
        v23 = v20;
      else
        v23 = v21;

      v62 = v22;
      v60 = v18;
      v61 = v49 - v22;
      v52 = v48 - v23;
      v53 = v23;
      v24 = var1;
LABEL_19:
      v63 = v24 + v23;
      v25 = v54;
      do
      {
        if (v25 > v61)
        {
          ++v24;
          v23 = v53;
          if (v24 <= v52)
            goto LABEL_19;

          v12 = v47;
          goto LABEL_58;
        }
        if (v24 >= v63)
          break;
        v26 = v25 + v62;
        v27 = 1;
        v28 = v24;
        do
        {
          v29 = v27 & 1;
          if ((v27 & 1) != 0 && v25 < v26)
          {
            v30 = v25 + 1;
            do
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "ccui_valueWithLayoutPoint:", v25, v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
                v33 = 0;
              else
                v33 = v27;

              v29 = v33 & 1;
              if ((v33 & 1) == 0)
                break;
            }
            while (v30++ < v26);
          }
          else
          {
            v33 = v27;
          }
          if (!v29)
            break;
          ++v28;
          v27 = v33;
        }
        while (v28 < v63);
        if (!v29)
          ++v25;
        v18 = v60;
      }
      while ((v33 & 1) == 0);
      if (v59 == 1)
        v35 = v24;
      else
        v35 = v25;
      if (v59 == 1)
        v36 = v25;
      else
        v36 = v24;
      v64[0] = v35;
      v64[1] = v36;
      v64[2] = v56;
      v64[3] = v55;
      objc_msgSend(MEMORY[0x1E0CB3B18], "ccui_valueWithLayoutRect:", v64);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKey:", v37, v18);
      v38 = v58;
      if (v58 <= v63)
        v38 = v63;
      v58 = v38;
      if (v24 < v63)
      {
        do
        {
          if (v25 < v25 + v62)
          {
            v39 = v62;
            v40 = v25;
            do
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "ccui_valueWithLayoutPoint:", v40, v24);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v18, v41);

              ++v40;
              --v39;
            }
            while (v39);
          }
          ++v24;
        }
        while (v24 != v63);
      }

      v17 = v57 + 1;
      v12 = v47;
      var1 = v46;
      if (v57 + 1 < (unint64_t)objc_msgSend(v47, "count"))
        continue;
      break;
    }
  }
  else
  {
    v58 = var1;
  }
LABEL_58:
  if (a8)
  {
    v43 = a7.height;
    v42 = a7.width;
    if (v59 == 1)
      v42 = v58;
    else
      v43 = v58;
    if (a8->width > v42)
      v42 = a8->width;
    if (a8->height > v43)
      v43 = a8->height;
    a8->width = v42;
    a8->height = v43;
  }
  v44 = (void *)objc_msgSend(v50, "copy");

  return v44;
}

- (CCUILayoutRect)layoutRectForIdentifier:(SEL)a3
{
  void *v5;
  CCUILayoutRect *result;
  void *v7;

  -[NSDictionary objectForKey:](self->_rectByIdentifier, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "ccui_rectValue");
    v5 = v7;
  }
  else
  {
    retstr->var0 = 0u;
    retstr->var1 = 0u;
  }

  return result;
}

- (CCUILayoutSize)layoutSize
{
  unint64_t height;
  unint64_t width;
  CCUILayoutSize result;

  height = self->_layoutSize.height;
  width = self->_layoutSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)regenerateRectsWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSDictionary *rectByIdentifier;
  NSArray *obj;
  uint64_t v29;
  uint64_t v30;
  CCUIControlCenterPositionProvider *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = CCUILayoutSizeZero;
  v30 = objc_msgSend(v6, "count");
  v31 = self;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_packingRules;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v29 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1D17DB7FC]();
        v14 = objc_msgSend(v12, "packFrom");
        if (v14 == 1)
        {
          v16 = 0;
          v15 = v36;
        }
        else if (v14)
        {
          v16 = 0;
          v15 = 0;
        }
        else
        {
          v15 = 0;
          v16 = *((_QWORD *)&v36 + 1);
        }
        v17 = objc_msgSend(v12, "packingOrder");
        v18 = objc_msgSend(v12, "sizeLimit");
        -[CCUIControlCenterPositionProvider _generateRectByIdentifierWithOrderedIdentifiers:orderedSizes:packingOrder:startPosition:maximumSize:outputLayoutSize:](v31, "_generateRectByIdentifierWithOrderedIdentifiers:orderedSizes:packingOrder:startPosition:maximumSize:outputLayoutSize:", v6, v7, v17, v15, v16, v18, v19, &v36);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v20);
        if (-[NSDictionary count](v8, "count") == v30)
        {

          objc_autoreleasePoolPop(v13);
          goto LABEL_18;
        }
        v21 = objc_msgSend(v20, "count");
        if (v21)
        {
          v22 = v21;
          v23 = objc_msgSend(v6, "count");
          v24 = v23 - v22;
          objc_msgSend(v6, "subarrayWithRange:", v22, v23 - v22);
          v25 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "subarrayWithRange:", v22, v24);
          v26 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v26;
          v6 = (id)v25;
        }

        objc_autoreleasePoolPop(v13);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

  rectByIdentifier = v31->_rectByIdentifier;
  v31->_rectByIdentifier = v8;

  v31->_layoutSize = (CCUILayoutSize)v36;
}

- (CCUIControlCenterPositionProvider)initWithPackingRules:(id)a3
{
  id v4;
  CCUIControlCenterPositionProvider *v5;
  uint64_t v6;
  NSArray *packingRules;
  NSDictionary *v8;
  NSDictionary *rectByIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIControlCenterPositionProvider;
  v5 = -[CCUIControlCenterPositionProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    packingRules = v5->_packingRules;
    v5->_packingRules = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rectByIdentifier = v5->_rectByIdentifier;
    v5->_rectByIdentifier = v8;

  }
  return v5;
}

- (CCUILayoutSize)maximumLayoutSize
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CCUILayoutSize result;

  -[NSArray lastObject](self->_packingRules, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sizeLimit");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectByIdentifier, 0);
  objc_storeStrong((id *)&self->_packingRules, 0);
}

@end
