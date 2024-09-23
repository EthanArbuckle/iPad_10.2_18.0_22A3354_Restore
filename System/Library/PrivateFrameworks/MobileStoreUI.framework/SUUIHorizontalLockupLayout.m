@implementation SUUIHorizontalLockupLayout

- (SUUIHorizontalLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  char *v8;
  int v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  __int128 v24;
  NSMapTable *v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  NSMapTable *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  char v41;
  _QWORD v42[4];
  _QWORD v43[3];
  char v44;
  _QWORD v45[3];
  char v46;
  _QWORD v47[4];
  objc_super v48;
  _OWORD v49[3];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SUUIHorizontalLockupLayout;
  v8 = -[SUUIHorizontalLockupLayout init](&v48, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "containsElementGroups");
    v49[0] = xmmword_241EFD040;
    v49[1] = xmmword_241EFD050;
    v49[2] = xmmword_241EFD060;
    v50 = 6;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 7);
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v44 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v11 = 3;
    if (v9)
      v11 = 4;
    v42[3] = v11;
    if (objc_msgSend(v6, "lockupViewType") == 6)
      v12 = 0.0;
    else
      v12 = 10.0;
    v41 = 0;
    objc_msgSend(v6, "firstChildForElementType:", 49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementMarginForStyle(v14, &v41);
    v16 = v15;

    if (v41)
      v17 = v16;
    else
      v17 = v12;
    *((double *)v8 + 2) = v17;
    if (objc_msgSend(v6, "lockupViewType") == 7)
    {
      *(_OWORD *)(v8 + 24) = xmmword_241EFD070;
      *(_OWORD *)(v8 + 40) = xmmword_241EFD080;
      v18 = 0x4052000000000000;
    }
    else
    {
      if (objc_msgSend(v6, "lockupViewType") == 6)
      {
        __asm { FMOV            V0.2D, #15.0 }
        *(_OWORD *)(v8 + 24) = _Q0;
        *(_OWORD *)(v8 + 40) = _Q0;
      }
      else
      {
        v24 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
        *(_OWORD *)(v8 + 24) = *MEMORY[0x24BEBE158];
        *(_OWORD *)(v8 + 40) = v24;
      }
      v18 = 0;
    }
    *((_QWORD *)v8 + 7) = v18;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __53__SUUIHorizontalLockupLayout_initWithLockup_context___block_invoke;
    v31[3] = &unk_2511FD980;
    v35 = v42;
    v40 = v9 ^ 1;
    v32 = v6;
    v36 = v45;
    v37 = v43;
    v33 = v7;
    v38 = v47;
    v39 = 6;
    v25 = v10;
    v34 = v25;
    objc_msgSend(v32, "enumerateChildrenUsingBlock:", v31);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMapTable count](v25, "count"));
    v27 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v26;

    for (i = 0; i != 56; i += 8)
    {
      NSMapGet(v25, (const void *)(*(_QWORD *)((char *)v49 + i) + 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        objc_msgSend(*((id *)v8 + 1), "addObject:", v29);

    }
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);

  }
  return (SUUIHorizontalLockupLayout *)v8;
}

void __53__SUUIHorizontalLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SUUIHorizontalLockupColumn *v22;
  id v23;
  _OWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v23 = v3;
  v5 = v23;
  if (objc_msgSend(v23, "elementType") == 90)
  {
    objc_msgSend(v23, "flattenedChildren");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
    if (v7)
    {
      v5 = v7;

    }
  }
  v8 = objc_msgSend(v5, "elementType");
  if (v8 <= 76)
  {
    if (v8 > 31)
    {
      switch(v8)
      {
        case '0':
          goto LABEL_52;
        case '1':
        case '3':
          goto LABEL_36;
        case '2':
          if (!*(_BYTE *)(a1 + 96))
            goto LABEL_52;
          objc_msgSend(v5, "style");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "columnType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("buttons"));

          if (!v11)
            goto LABEL_52;
          goto LABEL_29;
        default:
          if (v8 == 32 || v8 == 62)
            goto LABEL_52;
          break;
      }
      goto LABEL_55;
    }
    if (v8 <= 11)
    {
      if (v8 == 7)
      {
        objc_msgSend(v23, "firstChildForElementType:", 49);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
          goto LABEL_55;
        v21 = (void *)v20;

        v4 = 5;
        v5 = v21;
      }
      else if (v8 != 8)
      {
        goto LABEL_55;
      }
      goto LABEL_52;
    }
    if ((unint64_t)(v8 - 12) >= 2)
    {
      if (v8 != 29)
        goto LABEL_55;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_52;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = 2;
      goto LABEL_30;
    }
LABEL_28:
    if (!*(_BYTE *)(a1 + 96))
    {
LABEL_52:
      NSMapGet(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1));
      v22 = (SUUIHorizontalLockupColumn *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v22 = objc_alloc_init(SUUIHorizontalLockupColumn);
        -[SUUIHorizontalLockupColumn setIdentifier:](v22, "setIdentifier:", v4);
        NSMapInsert(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1), v22);
      }
      -[SUUIHorizontalLockupColumn _addChildViewElement:](v22, "_addChildViewElement:", v5);

      goto LABEL_55;
    }
LABEL_29:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = 1;
LABEL_30:
    *(_QWORD *)(v15 + 24) = v4;
    goto LABEL_52;
  }
  if (v8 > 134)
  {
    switch(v8)
    {
      case 135:
      case 144:
        goto LABEL_52;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_55;
      case 138:
        if (objc_msgSend(*(id *)(a1 + 32), "lockupViewType") != 7)
          goto LABEL_52;
        objc_msgSend(v5, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "length");
        if (v14)
          goto LABEL_52;
        goto LABEL_55;
      case 141:
        goto LABEL_28;
      default:
        if (v8 != 152 && v8 != 154)
          goto LABEL_55;
LABEL_36:
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && *(_BYTE *)(a1 + 96))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "lockupViewType") == 7)
            v4 = 6;
          else
            v4 = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        break;
    }
    goto LABEL_52;
  }
  if (v8 <= 89)
  {
    if (v8 != 77)
    {
      if (v8 != 80)
        goto LABEL_55;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        goto LABEL_55;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_55;
      objc_msgSend(*(id *)(a1 + 40), "aggregateValueForKey:", 0x251209688);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      if (!v17)
        goto LABEL_55;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v4 = 4;
      goto LABEL_52;
    }
    goto LABEL_28;
  }
  if (v8 == 90)
  {
    v4 = 0;
    goto LABEL_52;
  }
  if (v8 == 127)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v19 = *(_QWORD *)(v18 + 24);
    if (v19 < *(_QWORD *)(a1 + 88) - 1)
    {
      v24[0] = xmmword_241EFD040;
      v24[1] = xmmword_241EFD050;
      v24[2] = xmmword_241EFD060;
      v25 = 6;
      *(_QWORD *)(v18 + 24) = v19 + 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *((_QWORD *)v24
                                                                    + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                + 24));
    }
  }
LABEL_55:

}

+ (id)fontForButtonViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    SUUIViewElementFontWithStyle(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    if (objc_msgSend(v6, "containerViewElementType") == 118)
      v11 = 8;
    else
      v11 = 7;
    SUUIFontLimitedPreferredFontForTextStyle(v11, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_msgSend(v5, "labelViewStyle");
    if (v9 > 5)
    {
      v8 = 0;
    }
    else
    {
      if (((1 << v9) & 0x1B) != 0)
      {
        if (objc_msgSend(v6, "containerViewElementType") == 118)
          v10 = 8;
        else
          v10 = 7;
      }
      else if (objc_msgSend(v6, "containerViewElementType") == 118)
      {
        v10 = 6;
      }
      else
      {
        v10 = 19;
      }
      SUUIFontLimitedPreferredFontForTextStyle(v10, 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

+ (id)fontForOrdinalViewElement:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SUUIFontForTextStyle(25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v7, "_lightSystemFontOfSize:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)bottomPaddingForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0.0;
  if (v5 <= 76)
  {
    if (v5 == 8)
    {
      if (objc_msgSend(v4, "badgeType") == 1)
        v6 = 2.0;
      else
        v6 = 0.0;
      goto LABEL_13;
    }
    if (v5 != 13)
      goto LABEL_13;
LABEL_9:
    v6 = 5.0;
    goto LABEL_13;
  }
  if (v5 == 77)
    goto LABEL_9;
  if ((v5 == 135 || v5 == 138) && self->_tallestNonMetadataColumnHeight > 60.0)
    v6 = 2.0;
LABEL_13:

  return v6;
}

- (double)columnSpacingForColumnIdentifier:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if (a3)
      return 15.0;
    else
      return self->_imageMarginRight;
  }
  return result;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableArray *columns;
  id v9;
  uint64_t v10;
  double *v11;
  double v12;
  double metadataColumnMinHeight;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__100;
  v35 = __Block_byref_object_dispose__100;
  v36 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x3010000000;
  v28 = "";
  v29 = a3;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  self->_tallestNonMetadataColumnHeight = 0.0;
  v7 = -[NSMutableArray count](self->_columns, "count");
  columns = self->_columns;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__SUUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke;
  v14[3] = &unk_2511FD9A8;
  v19 = v7;
  v14[4] = self;
  v20 = a3;
  v9 = v6;
  v15 = v9;
  v16 = &v25;
  v17 = &v21;
  v18 = &v31;
  -[NSMutableArray enumerateObjectsUsingBlock:](columns, "enumerateObjectsUsingBlock:", v14);
  v10 = v32[5];
  if (v10)
  {
    -[SUUIHorizontalLockupLayout _heightForMetadataColumn:width:context:](self, "_heightForMetadataColumn:width:context:", v10, v9, v26[4]);
    v11 = v26;
    metadataColumnMinHeight = v12 + self->_metadataColumnEdgeInsets.top + self->_metadataColumnEdgeInsets.bottom;
    v26[5] = metadataColumnMinHeight;
    v11[4] = v11[4] - self->_metadataColumnEdgeInsets.left - self->_metadataColumnEdgeInsets.right;
    if (metadataColumnMinHeight < self->_metadataColumnMinHeight)
      metadataColumnMinHeight = self->_metadataColumnMinHeight;
    v11[5] = metadataColumnMinHeight;
    objc_msgSend((id)v32[5], "setSize:");
  }
  *(_QWORD *)&self->_tallestNonMetadataColumnHeight = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

void __60__SUUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  id v28;

  v28 = a2;
  v6 = objc_msgSend(v28, "identifier");
  v7 = 0.0;
  if (*(_QWORD *)(a1 + 72) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "columnSpacingForColumnIdentifier:", v6);
    v7 = v8;
  }
  switch(v6)
  {
    case 0:
      objc_msgSend(v28, "childViewElements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v15, (uint64_t)*(double *)(a1 + 80), *(_QWORD *)(a1 + 40));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v17);
      goto LABEL_10;
    case 1:
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_sizeForRightAlignedColumn:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 80));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v9);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(double *)(v11 + 24);
      if (v12 < v10)
        v12 = v10;
      *(double *)(v11 + 24) = v12;
      v13 = v28;
      goto LABEL_14;
    case 3:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - v7;
      break;
    case 4:
      objc_msgSend(v28, "childViewElements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "fontForOrdinalViewElement:context:", v22, *(_QWORD *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lineHeight");
      *(float *)&v24 = v24;
      v25 = ceilf(*(float *)&v24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + 43.0
                                                                   - v7);
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(double *)(v26 + 24);
      if (v27 < v25)
        v27 = v25;
      *(double *)(v26 + 24) = v27;
      objc_msgSend(v28, "setSize:", 43.0 - v7);

      break;
    case 5:
      objc_msgSend(v28, "childViewElements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v15, (uint64_t)*(double *)(a1 + 80), *(_QWORD *)(a1 + 40));
LABEL_10:
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(double *)(v19 + 24);
      if (v20 < v16)
        v20 = v16;
      *(double *)(v19 + 24) = v20;
      objc_msgSend(v28, "setSize:");

      break;
    case 6:
      v9 = *(double *)(a1 + 80);
      v13 = v28;
      v10 = v9;
LABEL_14:
      objc_msgSend(v13, "setSize:", v9, v10);
      break;
    default:
      break;
  }

}

- (double)topPaddingForViewElement:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if (objc_msgSend(v3, "elementType") != 8 || (v4 = 3.0, objc_msgSend(v3, "badgeType") != 1))
    v4 = 0.0;

  return v4;
}

- (double)_heightForMetadataColumn:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v8, "childViewElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 1)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__SUUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke;
    v14[3] = &unk_2511FA4A0;
    v14[4] = self;
    v17 = a4;
    v15 = v9;
    v16 = &v19;
    v18 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  }
  v12 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __69__SUUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  char isKindOfClass;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v10;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v10, (uint64_t)*(double *)(a1 + 56), *(_QWORD *)(a1 + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    if (*(_QWORD *)(a1 + 64) - 1 > a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "bottomPaddingForViewElement:", v10);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
    }
    v6 = v10;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", v10);
      v6 = v10;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
    }
  }

}

- (CGSize)_sizeForRightAlignedColumn:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  const char *v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGSize result;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x3010000000;
  v36 = "";
  v37 = *MEMORY[0x24BDBF148];
  objc_msgSend(v8, "childViewElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 1)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __71__SUUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke;
    v28[3] = &unk_2511FA4A0;
    v28[4] = self;
    v31 = a4;
    v12 = v9;
    v29 = v12;
    v30 = &v33;
    v32 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
    v23 = v9;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v17, "elementType") == 138)
          {
            -[SUUIHorizontalLockupLayout _sizeForViewElement:width:context:](self, "_sizeForViewElement:width:context:", v17, (uint64_t)a4, v12);
            v34[5] = v18 + v34[5];
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      }
      while (v14);
    }

    v9 = v23;
  }
  v19 = v34[4];
  v20 = v34[5];

  _Block_object_dispose(&v33, 8);
  v21 = v19;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __71__SUUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "elementType") != 138)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v11, (uint64_t)*(double *)(a1 + 56), *(_QWORD *)(a1 + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v6
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(double *)(v7 + 32) >= v5)
      v5 = *(double *)(v7 + 32);
    *(double *)(v7 + 32) = v5;
  }
  if (*(_QWORD *)(a1 + 64) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bottomPaddingForViewElement:", v11);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
  }
  v9 = v11;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", v11);
    v9 = v11;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
  }

}

- (CGSize)_sizeForViewElement:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "elementType") == 90
    && (objc_msgSend(v8, "flattenedChildren"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        objc_msgSend(v9, "firstObject"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        !v8))
  {
    v11 = 29.0;
    v13 = 29.0;
  }
  else
  {
    objc_msgSend(v7, "sizeForViewElement:width:", v8, (double)a4);
    v11 = v10;
    v13 = v12;
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSArray)columns
{
  return &self->_columns->super;
}

- (UIEdgeInsets)metadataColumnEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_metadataColumnEdgeInsets.top;
  left = self->_metadataColumnEdgeInsets.left;
  bottom = self->_metadataColumnEdgeInsets.bottom;
  right = self->_metadataColumnEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
