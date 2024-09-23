@implementation CRKRightPaddingTableEntry

- (CRKRightPaddingTableEntry)initWithObject:(id)a3
{
  id v6;
  CRKRightPaddingTableEntry *v7;
  CRKRightPaddingTableEntry *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKRightPaddingTableEntry.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKRightPaddingTableEntry;
  v7 = -[CRKRightPaddingTableEntry init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong(&v7->mObject, a3);

  return v8;
}

- (id)rawStringValue
{
  return (id)objc_msgSend(self->mObject, "description");
}

- (id)stringValueWithLength:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CRKRightPaddingTableEntry rawStringValue](self, "rawStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mObject, 0);
}

@end
