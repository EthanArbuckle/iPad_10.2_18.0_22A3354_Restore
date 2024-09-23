@implementation GEOStorefrontBundleId

- (GEOStorefrontBundleId)init
{
  GEOStorefrontBundleId *result;

  result = (GEOStorefrontBundleId *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontBundleId)initWithBundleId:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  GEOStorefrontBundleId *v6;
  NSDate *v7;
  NSDate *date;
  GEOStorefrontBundleId *v9;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if ((~*((unsigned __int8 *)v4 + 24) & 3) != 0)
    goto LABEL_6;
  v11.receiver = self;
  v11.super_class = (Class)GEOStorefrontBundleId;
  v6 = -[GEOStorefrontBundleId init](&v11, sel_init);
  self = v6;
  if (!v6)
    goto LABEL_6;
  v6->_identifier = v5[1];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)v5[2]);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v7;

  if (self->_date)
  {
    self = self;
    v9 = self;
  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
