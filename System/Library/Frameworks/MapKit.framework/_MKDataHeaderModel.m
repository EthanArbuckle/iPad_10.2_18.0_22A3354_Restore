@implementation _MKDataHeaderModel

- (_MKDataHeaderModel)init
{
  _MKDataHeaderModel *v2;
  _MKLineHeaderModel *v3;
  _MKLineHeaderModel *firstLine;
  _MKLineHeaderModel *v5;
  _MKLineHeaderModel *secondLine;
  _MKLineHeaderModel *v7;
  _MKLineHeaderModel *thirdLine;
  _MKLineHeaderModel *v9;
  _MKLineHeaderModel *forthLine;
  _MKLineHeaderModel *v11;
  _MKLineHeaderModel *secondaryNameLine;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_MKDataHeaderModel;
  v2 = -[_MKDataHeaderModel init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_MKLineHeaderModel);
    firstLine = v2->_firstLine;
    v2->_firstLine = v3;

    v5 = objc_alloc_init(_MKLineHeaderModel);
    secondLine = v2->_secondLine;
    v2->_secondLine = v5;

    v7 = objc_alloc_init(_MKLineHeaderModel);
    thirdLine = v2->_thirdLine;
    v2->_thirdLine = v7;

    v9 = objc_alloc_init(_MKLineHeaderModel);
    forthLine = v2->_forthLine;
    v2->_forthLine = v9;

    v11 = objc_alloc_init(_MKLineHeaderModel);
    secondaryNameLine = v2->_secondaryNameLine;
    v2->_secondaryNameLine = v11;

  }
  return v2;
}

- (void)setOwnerView:(id)a3
{
  _MKLineHeaderModel *firstLine;
  id v5;

  firstLine = self->_firstLine;
  v5 = a3;
  -[_MKLineHeaderModel setOwnerView:](firstLine, "setOwnerView:", v5);
  -[_MKLineHeaderModel setOwnerView:](self->_secondLine, "setOwnerView:", v5);
  -[_MKLineHeaderModel setOwnerView:](self->_thirdLine, "setOwnerView:", v5);
  -[_MKLineHeaderModel setOwnerView:](self->_forthLine, "setOwnerView:", v5);
  -[_MKLineHeaderModel setOwnerView:](self->_secondaryNameLine, "setOwnerView:", v5);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(&stru_1E20DFC00, "mutableCopy");
  -[_MKLineHeaderModel description](self->_firstLine, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("1: %@\n"), v4);

  -[_MKLineHeaderModel description](self->_secondLine, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("2: %@\n"), v5);

  -[_MKLineHeaderModel description](self->_firstLine, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("3: %@\n"), v6);

  -[_MKLineHeaderModel description](self->_thirdLine, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("4: %@\n"), v7);

  -[_MKLineHeaderModel description](self->_forthLine, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("5: %@\n"), v8);

  -[_MKLineHeaderModel description](self->_secondaryNameLine, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("6: %@\n"), v9);

  return v3;
}

- (UIView)ownerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ownerView);
}

- (_MKLineHeaderModel)firstLine
{
  return self->_firstLine;
}

- (void)setFirstLine:(id)a3
{
  objc_storeStrong((id *)&self->_firstLine, a3);
}

- (_MKLineHeaderModel)secondLine
{
  return self->_secondLine;
}

- (void)setSecondLine:(id)a3
{
  objc_storeStrong((id *)&self->_secondLine, a3);
}

- (_MKLineHeaderModel)thirdLine
{
  return self->_thirdLine;
}

- (void)setThirdLine:(id)a3
{
  objc_storeStrong((id *)&self->_thirdLine, a3);
}

- (_MKLineHeaderModel)forthLine
{
  return self->_forthLine;
}

- (void)setForthLine:(id)a3
{
  objc_storeStrong((id *)&self->_forthLine, a3);
}

- (MKTransitInfoLabelView)transitLabel
{
  return self->_transitLabel;
}

- (void)setTransitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_transitLabel, a3);
}

- (_MKLineHeaderModel)secondaryNameLine
{
  return self->_secondaryNameLine;
}

- (void)setSecondaryNameLine:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryNameLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryNameLine, 0);
  objc_storeStrong((id *)&self->_transitLabel, 0);
  objc_storeStrong((id *)&self->_forthLine, 0);
  objc_storeStrong((id *)&self->_thirdLine, 0);
  objc_storeStrong((id *)&self->_secondLine, 0);
  objc_storeStrong((id *)&self->_firstLine, 0);
  objc_destroyWeak((id *)&self->_ownerView);
}

@end
