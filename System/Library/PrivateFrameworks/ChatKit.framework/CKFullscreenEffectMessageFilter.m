@implementation CKFullscreenEffectMessageFilter

- (CKFullscreenEffectMessageFilter)init
{
  CKFullscreenEffectMessageFilter *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFullscreenEffectMessageFilter;
  result = -[CKFullscreenEffectMessageFilter init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_balloonAlpha = _Q0;
    result->_shouldUseMaskImage = 0;
  }
  return result;
}

- (CKFullscreenEffectMessageFilter)initWithDictionary:(id)a3
{
  id v4;
  CKFullscreenEffectMessageFilter *v5;
  id v6;
  int v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *balloonFilters;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *balloonBackdropFilters;
  void *v32;
  uint64_t v33;
  CAFilter *balloonCompositingFilter;
  void *v35;
  void *v36;
  double v37;
  double v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  uint64_t v44;
  CAFilter *textCompositingFilter;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKFullscreenEffectMessageFilter;
  v5 = -[CKFullscreenEffectMessageFilter init](&v60, sel_init);
  if (!v5)
    goto LABEL_59;
  objc_msgSend(v4, "_stringForKey:", CFSTR("type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("text")) & 1) != 0)
    goto LABEL_3;
  if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("status")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("replaybutton")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("bigemoji")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("tapback")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("sticker")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("trigerringmessage")) & 1) != 0)
  {
    v7 = 6;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("allother")) & 1) == 0)
    {
      v47 = v6;
      _IMWarn();
LABEL_3:
      v7 = 0;
      goto LABEL_18;
    }
    v7 = 999;
  }
LABEL_18:

  v5->_type = v7;
  objc_msgSend(v4, "_stringForKey:", CFSTR("direction"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v6;
  if ((objc_msgSend(v8, "isEqualToIgnoringCase:", CFSTR("both")) & 1) == 0)
  {
    if ((objc_msgSend(v8, "isEqualToIgnoringCase:", CFSTR("incoming")) & 1) != 0)
    {
      v9 = 2;
      goto LABEL_24;
    }
    if ((objc_msgSend(v8, "isEqualToIgnoringCase:", CFSTR("outgoing")) & 1) != 0)
    {
      v9 = 1;
      goto LABEL_24;
    }
    v47 = v8;
    _IMWarn();
  }
  v9 = 0;
LABEL_24:
  v49 = v8;

  v5->_direction = v9;
  objc_msgSend(v4, "_arrayForKey:", CFSTR("balloonFilters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10;
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v57 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CD2780], "ck_filterWithDictionary:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v11, "copy");
    balloonFilters = v5->_balloonFilters;
    v5->_balloonFilters = (NSArray *)v19;

    v10 = v51;
  }
  objc_msgSend(v4, "_arrayForKey:", CFSTR("balloonBackdropFilters"), v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v48 = v21;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v53 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CD2780], "ck_filterWithDictionary:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v25);
    }

    v30 = objc_msgSend(v22, "copy");
    balloonBackdropFilters = v5->_balloonBackdropFilters;
    v5->_balloonBackdropFilters = (NSArray *)v30;

    v10 = v51;
    v21 = v48;
  }
  objc_msgSend(v4, "_dictionaryForKey:", CFSTR("balloonCompositingFilter"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "ck_filterWithDictionary:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    balloonCompositingFilter = v5->_balloonCompositingFilter;
    v5->_balloonCompositingFilter = (CAFilter *)v33;

  }
  objc_msgSend(v4, "_numberForKey:", CFSTR("balloonAlpha"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  v37 = 1.0;
  v38 = 1.0;
  if (v35)
  {
    objc_msgSend(v35, "floatValue", 1.0);
    v38 = v39;
  }
  v5->_balloonAlpha = v38;
  objc_msgSend(v4, "_numberForKey:", CFSTR("contentAlpha"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    objc_msgSend(v40, "floatValue");
    v37 = v42;
  }
  v5->_contentAlpha = v37;
  objc_msgSend(v4, "_dictionaryForKey:", CFSTR("textCompositingFilter"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "ck_filterWithDictionary:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    textCompositingFilter = v5->_textCompositingFilter;
    v5->_textCompositingFilter = (CAFilter *)v44;

  }
LABEL_59:

  return v5;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (NSArray)balloonFilters
{
  return self->_balloonFilters;
}

- (void)setBalloonFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)balloonBackdropFilters
{
  return self->_balloonBackdropFilters;
}

- (void)setBalloonBackdropFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CAFilter)balloonCompositingFilter
{
  return self->_balloonCompositingFilter;
}

- (void)setBalloonCompositingFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)balloonAlpha
{
  return self->_balloonAlpha;
}

- (void)setBalloonAlpha:(double)a3
{
  self->_balloonAlpha = a3;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (CAFilter)textCompositingFilter
{
  return self->_textCompositingFilter;
}

- (void)setTextCompositingFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)shouldUseMaskImage
{
  return self->_shouldUseMaskImage;
}

- (void)setShouldUseMaskImage:(BOOL)a3
{
  self->_shouldUseMaskImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textCompositingFilter, 0);
  objc_storeStrong((id *)&self->_balloonCompositingFilter, 0);
  objc_storeStrong((id *)&self->_balloonBackdropFilters, 0);
  objc_storeStrong((id *)&self->_balloonFilters, 0);
}

@end
