@implementation COAlarmManager(Home)

+ (id)hf_AlarmManagerForAccessory:()Home
{
  id v3;
  _HFAlarmConnectionProvider *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_HFAlarmConnectionProvider);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D148D8]), "initForAccessory:withConnectionProvider:", v3, v4);

  return v5;
}

@end
