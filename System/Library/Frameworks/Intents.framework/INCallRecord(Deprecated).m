@implementation INCallRecord(Deprecated)

- (INPerson)caller
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[INCallRecord participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[INCallRecord participants](self, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (INPerson *)v6;
}

@end
