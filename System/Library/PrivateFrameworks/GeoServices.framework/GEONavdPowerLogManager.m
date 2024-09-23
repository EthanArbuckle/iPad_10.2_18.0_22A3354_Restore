@implementation GEONavdPowerLogManager

+ (void)_powerLogWithEventName:(id)a3
{
  id v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") && PLShouldLogRegisteredEvent())
  {
    v4 = CFSTR("Event");
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    PLLogRegisteredEvent();
  }

}

@end
