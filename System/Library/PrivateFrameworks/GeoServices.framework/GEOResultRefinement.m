@implementation GEOResultRefinement

- (GEOResultRefinement)initWithToggle:(id)a3
{
  id v5;
  GEOResultRefinement *v6;
  GEOResultRefinement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = -[GEOResultRefinement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_toggle, a3);
    v7->_type = 1;
  }

  return v7;
}

- (GEOResultRefinement)initWithMultiSelect:(id)a3
{
  id v5;
  GEOResultRefinement *v6;
  GEOResultRefinement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = -[GEOResultRefinement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_multiSelect, a3);
    v7->_type = 2;
  }

  return v7;
}

- (GEOResultRefinement)initWithSort:(id)a3
{
  id v5;
  GEOResultRefinement *v6;
  GEOResultRefinement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = -[GEOResultRefinement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sort, a3);
    v7->_type = 3;
  }

  return v7;
}

- (GEOResultRefinement)initWithOpenOptions:(id)a3
{
  id v5;
  GEOResultRefinement *v6;
  GEOResultRefinement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = -[GEOResultRefinement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_openOptions, a3);
    v7->_type = 4;
  }

  return v7;
}

- (GEOResultRefinement)initWithResultRefinement:(id)a3
{
  id *v4;
  GEOResultRefinement *v5;
  GEOResultRefinementToggle *v6;
  void *v7;
  GEOResultRefinementToggle *v8;
  GEOResultRefinement *v9;
  GEOResultRefinementMultiSelect *v10;
  void *v11;
  GEOResultRefinementSort *v12;
  void *v13;
  GEOResultRefinementOpenOptions *v14;
  void *v15;

  v4 = (id *)a3;
  v5 = 0;
  switch(-[GEOPDResultRefinement resultRefinementType]((uint64_t)v4))
  {
    case 1u:
      v6 = [GEOResultRefinementToggle alloc];
      -[GEOPDResultRefinement toggle](v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOResultRefinementToggle initWithResultRefinementToggle:](v6, "initWithResultRefinementToggle:", v7);

      if (!v8)
        goto LABEL_8;
      v9 = -[GEOResultRefinement initWithToggle:](self, "initWithToggle:", v8);
      goto LABEL_10;
    case 3u:
      v10 = [GEOResultRefinementMultiSelect alloc];
      -[GEOPDResultRefinement multiSelect](v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOResultRefinementMultiSelect initWithResultRefinementMultiSelect:](v10, "initWithResultRefinementMultiSelect:", v11);

      if (!v8)
        goto LABEL_8;
      v9 = -[GEOResultRefinement initWithMultiSelect:](self, "initWithMultiSelect:", v8);
      goto LABEL_10;
    case 4u:
      v12 = [GEOResultRefinementSort alloc];
      -[GEOPDResultRefinement sort](v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOResultRefinementSort initWithResultRefinementSort:](v12, "initWithResultRefinementSort:", v13);

      if (v8)
      {
        v9 = -[GEOResultRefinement initWithSort:](self, "initWithSort:", v8);
LABEL_10:
        self = v9;
        v5 = self;
      }
      else
      {
LABEL_8:
        v5 = 0;
      }

LABEL_12:
      return v5;
    case 6u:
      v14 = [GEOResultRefinementOpenOptions alloc];
      -[GEOPDResultRefinement openOptions](v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOResultRefinementOpenOptions initWithOpenOptions:](v14, "initWithOpenOptions:", v15);

      v9 = -[GEOResultRefinement initWithOpenOptions:](self, "initWithOpenOptions:", v8);
      goto LABEL_10;
    default:
      goto LABEL_12;
  }
}

- (id)convertToGEOPDResultRefinement
{
  GEOPDResultRefinement *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(GEOPDResultRefinement);
  switch(-[GEOResultRefinement type](self, "type"))
  {
    case 0:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 0;
      }
      return v3;
    case 1:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 1;
      }
      -[GEOResultRefinement toggle](self, "toggle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertToGEOPDResultRefinementToggle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDResultRefinement setToggle:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 2:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 3;
      }
      -[GEOResultRefinement multiSelect](self, "multiSelect");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertToGEOPDResultRefinementMultiSelect");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDResultRefinement setMultiSelect:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 3:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 4;
      }
      -[GEOResultRefinement sort](self, "sort");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertToGEOPDResultRefinementSort");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDResultRefinement setSort:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 4:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 6;
      }
      -[GEOResultRefinement openOptions](self, "openOptions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertToGEOPDResultRefinementOpenOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDResultRefinement setOpenOptions:]((uint64_t)v3, v5);
LABEL_16:

      break;
    default:
      return v3;
  }
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (GEOResultRefinementToggle)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
  objc_storeStrong((id *)&self->_toggle, a3);
}

- (GEOResultRefinementMultiSelect)multiSelect
{
  return self->_multiSelect;
}

- (void)setMultiSelect:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelect, a3);
}

- (GEOResultRefinementSort)sort
{
  return self->_sort;
}

- (void)setSort:(id)a3
{
  objc_storeStrong((id *)&self->_sort, a3);
}

- (GEOResultRefinementOpenOptions)openOptions
{
  return self->_openOptions;
}

- (void)setOpenOptions:(id)a3
{
  objc_storeStrong((id *)&self->_openOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openOptions, 0);
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);
  objc_storeStrong((id *)&self->_toggle, 0);
}

@end
