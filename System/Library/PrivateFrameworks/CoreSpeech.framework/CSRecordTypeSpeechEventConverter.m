@implementation CSRecordTypeSpeechEventConverter

+ (int64_t)getRecordTypeForSpeechEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x23)
    return 0;
  else
    return qword_1C276CAB8[a3 - 1];
}

+ (int64_t)getSpeechEventForRecordType:(int64_t)a3
{
  if ((unint64_t)(a3 - 20) > 7)
    return 0;
  else
    return qword_1C276CBD8[a3 - 20];
}

@end
