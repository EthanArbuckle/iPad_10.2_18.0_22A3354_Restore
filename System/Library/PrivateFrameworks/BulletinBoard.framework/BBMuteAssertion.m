@implementation BBMuteAssertion

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BBMuteAssertion;
  return -[BBMuteAssertion init](&v3, sel_init);
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBMuteAssertion.m"), 30, CFSTR("use subclasses"));

  return 0;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBMuteAssertion.m"), 35, CFSTR("use subclasses"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBMuteAssertion)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BBMuteAssertion;
  return -[BBMuteAssertion init](&v4, sel_init, a3);
}

+ (id)assertionFromUNCMuteAssertion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "expirationDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BBSectionMuteAssertion sectionMuteAssertionUntilDate:](BBSectionMuteAssertion, "sectionMuteAssertionUntilDate:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BBMuteAssertion.m"), 72, CFSTR("unsupported subclass"));
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v5, "expirationDateByThreadID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BBThreadsMuteAssertion threadsMuteAssertionWithExpirationDateByThreadID:](BBThreadsMuteAssertion, "threadsMuteAssertionWithExpirationDateByThreadID:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)toUNCMuteAssertion
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBMuteAssertion.m"), 78, CFSTR("use subclasses"));

  return 0;
}

@end
