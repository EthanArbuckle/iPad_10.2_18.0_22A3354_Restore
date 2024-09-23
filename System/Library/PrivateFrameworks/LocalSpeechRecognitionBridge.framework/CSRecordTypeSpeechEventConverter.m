@implementation CSRecordTypeSpeechEventConverter

+ (int64_t)getRecordTypeForSpeechEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x23)
    return 0;
  else
    return qword_2141B5EA8[a3 - 1];
}

+ (int64_t)getSpeechEventForRecordType:(int64_t)a3
{
  if ((unint64_t)(a3 - 20) > 7)
    return 0;
  else
    return qword_2141B5FC8[a3 - 20];
}

@end
