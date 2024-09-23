@implementation HKCodableDismissibleCellHeaderViewModel

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableDismissibleCellHeaderViewModel;
  -[HKCodableDismissibleCellHeaderViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableDismissibleCellHeaderViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableCellHeaderViewModel *viewModel;
  void *v5;
  HKCodableColorRepresentation *backgroundColor;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  if (viewModel)
  {
    -[HKCodableCellHeaderViewModel dictionaryRepresentation](viewModel, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("viewModel"));

  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[HKCodableColorRepresentation dictionaryRepresentation](backgroundColor, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("backgroundColor"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableDismissibleCellHeaderViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_viewModel)
    -[HKCodableDismissibleCellHeaderViewModel writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_backgroundColor)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setViewModel:", self->_viewModel);
  if (self->_backgroundColor)
    objc_msgSend(v4, "setBackgroundColor:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableCellHeaderViewModel copyWithZone:](self->_viewModel, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HKCodableColorRepresentation copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableCellHeaderViewModel *viewModel;
  HKCodableColorRepresentation *backgroundColor;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((viewModel = self->_viewModel, !((unint64_t)viewModel | v4[2]))
     || -[HKCodableCellHeaderViewModel isEqual:](viewModel, "isEqual:")))
  {
    backgroundColor = self->_backgroundColor;
    if ((unint64_t)backgroundColor | v4[1])
      v7 = -[HKCodableColorRepresentation isEqual:](backgroundColor, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKCodableCellHeaderViewModel hash](self->_viewModel, "hash");
  return -[HKCodableColorRepresentation hash](self->_backgroundColor, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableCellHeaderViewModel *viewModel;
  uint64_t v6;
  HKCodableColorRepresentation *backgroundColor;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  viewModel = self->_viewModel;
  v6 = v4[2];
  v9 = v4;
  if (viewModel)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableCellHeaderViewModel mergeFrom:](viewModel, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableDismissibleCellHeaderViewModel setViewModel:](self, "setViewModel:");
  }
  v4 = v9;
LABEL_7:
  backgroundColor = self->_backgroundColor;
  v8 = v4[1];
  if (backgroundColor)
  {
    if (v8)
    {
      -[HKCodableColorRepresentation mergeFrom:](backgroundColor, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HKCodableDismissibleCellHeaderViewModel setBackgroundColor:](self, "setBackgroundColor:");
    goto LABEL_12;
  }

}

- (HKCodableCellHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (HKCodableColorRepresentation)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableDismissibleCellHeaderViewModel writeTo:]", "HKCodableDismissibleCellHeaderViewModel.m", 114, "self->_viewModel != nil");
}

@end
