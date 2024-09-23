@implementation CLKDatesHaveSameTimeDesignatorPeriod

uint64_t __CLKDatesHaveSameTimeDesignatorPeriod_block_invoke()
{
  CLKTimeFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(CLKTimeFormatter);
  v1 = (void *)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter;
  CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter = (uint64_t)v0;

  objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "setSuppressesDesignatorWhitespace:", 1);
  return objc_msgSend((id)CLKDatesHaveSameTimeDesignatorPeriod___timeFormatter, "setPaused:forReason:", 1, CFSTR("AlwaysPaused"));
}

@end
