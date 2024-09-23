@implementation DTSysmonTapSupportedAttributes

+ (id)localProcessAttributes
{
  if (qword_25576FB50 != -1)
    dispatch_once(&qword_25576FB50, &unk_24EB27910);
  return (id)qword_25576FB48;
}

+ (id)localSystemAttributes
{
  if (qword_25576FB60 != -1)
    dispatch_once(&qword_25576FB60, &unk_24EB2A358);
  return (id)qword_25576FB58;
}

+ (id)localCoalitionAttributes
{
  if (qword_25576FB70 != -1)
    dispatch_once(&qword_25576FB70, &unk_24EB27AD0);
  return (id)qword_25576FB68;
}

+ (id)localProcessAttributesMap
{
  if (qword_25576FB80 != -1)
    dispatch_once(&qword_25576FB80, &unk_24EB2A378);
  return (id)qword_25576FB78;
}

+ (id)localSystemAttributesMap
{
  if (qword_25576FB90 != -1)
    dispatch_once(&qword_25576FB90, &unk_24EB27AF0);
  return (id)qword_25576FB88;
}

+ (id)localCoalitionAttributesMap
{
  if (qword_25576FBA0 != -1)
    dispatch_once(&qword_25576FBA0, &unk_24EB2A398);
  return (id)qword_25576FB98;
}

@end
