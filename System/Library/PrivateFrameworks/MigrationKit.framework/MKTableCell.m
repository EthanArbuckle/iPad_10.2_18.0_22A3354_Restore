@implementation MKTableCell

+ (id)cellWithValue:(id)a3 formatter:(id)a4
{
  return +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", a3, a4, 1, 0);
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5
{
  return +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 alignment:(int64_t)a5
{
  return +[MKTableCell cellWithValue:formatter:columnSpan:alignment:](MKTableCell, "cellWithValue:formatter:columnSpan:alignment:", a3, a4, 1, a5);
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5 alignment:(int64_t)a6
{
  uint64_t v7;
  id v9;
  id v10;
  MKTableCell *v11;
  MKTableCell *v12;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MKTableCell);
  v12 = v11;
  if (v11)
  {
    -[MKTableCell setValue:](v11, "setValue:", v9);
    -[MKTableCell setFormatter:](v12, "setFormatter:", v10);
    -[MKTableCell setColumnSpan:](v12, "setColumnSpan:", v7);
    -[MKTableCell setAlignment:](v12, "setAlignment:", a6);
  }

  return v12;
}

- (id)formattedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKTableCell formatter](self, "formatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKTableCell formatter](self, "formatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTableCell value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForObjectValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MKTableCell value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(int)a3
{
  self->_columnSpan = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
