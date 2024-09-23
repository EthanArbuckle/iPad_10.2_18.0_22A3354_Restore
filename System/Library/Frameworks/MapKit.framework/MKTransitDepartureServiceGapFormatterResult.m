@implementation MKTransitDepartureServiceGapFormatterResult

- (MKTransitDepartureServiceGapFormatterResult)initWithFormat:(id)a3 dateDescription:(id)a4 dateFormat:(unint64_t)a5
{
  id v8;
  id v9;
  MKTransitDepartureServiceGapFormatterResult *v10;
  uint64_t v11;
  NSString *format;
  uint64_t v13;
  NSString *dateDescription;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MKTransitDepartureServiceGapFormatterResult;
  v10 = -[MKTransitDepartureServiceGapFormatterResult init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    format = v10->_format;
    v10->_format = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    dateDescription = v10->_dateDescription;
    v10->_dateDescription = (NSString *)v13;

    v10->_dateFormat = a5;
  }

  return v10;
}

- (NSString)formattedString
{
  NSString *v2;

  if (self->_dateDescription)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", self->_format, self->_dateDescription);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_format;
  }
  return v2;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)dateDescription
{
  return self->_dateDescription;
}

- (unint64_t)dateFormat
{
  return self->_dateFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateDescription, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
