@implementation QLBarButtonItem

- (BOOL)_qlIsEqual:(id)a3
{
  QLBarButtonItem *v4;
  QLBarButtonItem *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (QLBarButtonItem *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[QLBarButtonItem QLType](self, "QLType");
      if (v6 != -[QLBarButtonItem QLType](v5, "QLType"))
        goto LABEL_12;
      if (-[QLBarButtonItem QLType](self, "QLType") == 3)
      {
        v7 = -[QLBarButtonItem action](self, "action");
        if (v7 != -[QLBarButtonItem action](v5, "action"))
          goto LABEL_12;
      }
      -[QLBarButtonItem target](self, "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLBarButtonItem target](v5, "target");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v9
        && (v10 = -[QLBarButtonItem systemItem](self, "systemItem"),
            v10 == -[QLBarButtonItem systemItem](v5, "systemItem")))
      {
        -[QLBarButtonItem title](self, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLBarButtonItem title](v5, "title");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {
          v16 = 1;
          v13 = v11;
        }
        else
        {
          v13 = (void *)v12;
          -[QLBarButtonItem title](self, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[QLBarButtonItem title](v5, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

        }
      }
      else
      {
LABEL_12:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)QLType
{
  return self->_QLType;
}

- (void)setQLType:(unint64_t)a3
{
  self->_QLType = a3;
}

@end
