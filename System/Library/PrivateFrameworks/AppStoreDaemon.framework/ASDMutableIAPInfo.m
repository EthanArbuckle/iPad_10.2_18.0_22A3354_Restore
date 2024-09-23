@implementation ASDMutableIAPInfo

- (void)setExpirationTimestamp:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDIAPInfo setExpirationDate:](self, "setExpirationDate:", v5);

}

- (void)setLastModifiedTimestamp:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDIAPInfo setLastModifiedDate:](self, "setLastModifiedDate:", v5);

}

- (void)setPurchaseTimestamp:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDIAPInfo setPurchaseDate:](self, "setPurchaseDate:", v5);

}

@end
