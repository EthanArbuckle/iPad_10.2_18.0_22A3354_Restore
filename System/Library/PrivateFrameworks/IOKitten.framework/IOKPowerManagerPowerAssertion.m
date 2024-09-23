@implementation IOKPowerManagerPowerAssertion

- (IOKPowerManagerPowerAssertion)initWithName:(id)a3 assertionTyoe:(id)a4 assertionLevel:(unsigned int)a5
{
  __CFString *v8;
  __CFString *v9;
  IOKPowerManagerPowerAssertion *v10;
  IOKPowerManagerPowerAssertion *v11;
  objc_super v13;

  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)IOKPowerManagerPowerAssertion;
  v10 = -[IOKPowerManagerPowerAssertion init](&v13, sel_init);
  v11 = v10;
  if (v10 && IOPMAssertionCreateWithName(v9, a5, v8, &v10->_pmAssertionID))
  {

    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  IOPMAssertionRelease(self->_pmAssertionID);
  v3.receiver = self;
  v3.super_class = (Class)IOKPowerManagerPowerAssertion;
  -[IOKPowerManagerPowerAssertion dealloc](&v3, sel_dealloc);
}

@end
