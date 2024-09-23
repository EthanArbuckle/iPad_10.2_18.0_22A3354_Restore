@implementation CLKDesignatorRequiresWhitespace

void __CLKDesignatorRequiresWhitespace_block_invoke()
{
  id v0;

  CLKLocalizedString(CFSTR("DESIGNATOR_REQUIRES_WHITESPACE"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKDesignatorRequiresWhitespace_requiresWhitespace = objc_msgSend(v0, "BOOLValue");

}

@end
