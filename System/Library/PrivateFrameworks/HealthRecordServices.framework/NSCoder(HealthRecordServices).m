@implementation NSCoder(HealthRecordServices)

- (void)hrs_failWithCocoaValueNotFoundError
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hrs_cocoaValueNotFoundError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "failWithError:", v2);

}

- (void)hrs_failWithCocoaInvalidValueError
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hrs_cocoaInvalidValueError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "failWithError:", v2);

}

@end
