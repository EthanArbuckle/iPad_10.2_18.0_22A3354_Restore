@implementation MKCallHistoryNumbers

- (MKCallHistoryNumbers)initWithSerializedData:(id)a3
{
  id v4;
  MKCallHistoryNumbers *v5;
  void *v6;
  MKCallHistoryNumbers *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKCallHistoryNumbers;
  v5 = -[MKCallHistoryNumbers init](&v9, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "mk_arrayForKey:", CFSTR("numbers_in_use"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCallHistoryNumbers setNumbersInUse:](v5, "setNumbersInUse:", v6);

  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (NSArray)numbersInUse
{
  return self->_numbersInUse;
}

- (void)setNumbersInUse:(id)a3
{
  objc_storeStrong((id *)&self->_numbersInUse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numbersInUse, 0);
}

@end
