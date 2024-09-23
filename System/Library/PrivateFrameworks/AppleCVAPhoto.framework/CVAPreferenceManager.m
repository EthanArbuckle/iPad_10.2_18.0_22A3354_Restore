@implementation CVAPreferenceManager

+ (id)defaults
{
  if (qword_1EF12D300 != -1)
    dispatch_once(&qword_1EF12D300, &unk_1E6936E78);
  return (id)qword_1EF12D308;
}

@end
