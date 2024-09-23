@implementation BCCloudDataNullPrivacyDelegate

+ (id)nullPrivacyDelegate
{
  if (qword_25592A4E8 != -1)
    dispatch_once(&qword_25592A4E8, &unk_24F08A460);
  return (id)qword_25592A4E0;
}

- (BOOL)establishedSalt
{
  return 1;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v5 = CFSTR("-");
  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = CFSTR("-");
  if (a4)
    v5 = (const __CFString *)a4;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@.%@"), (uint64_t)a4, v4, v6, v5);
}

@end
