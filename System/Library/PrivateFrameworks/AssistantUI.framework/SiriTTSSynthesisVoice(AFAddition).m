@implementation SiriTTSSynthesisVoice(AFAddition)

- (uint64_t)AFVoiceFootprint
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "footprint");
  if (v1 > 3)
    return 0;
  else
    return qword_217562FD8[v1];
}

@end
