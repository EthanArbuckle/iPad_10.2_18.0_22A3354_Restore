@implementation NSMorphology(ConvenienceInit)

+ (id)morphologyWithCase:()ConvenienceInit determination:
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setGrammaticalCase:", a3);
  objc_msgSend(v6, "setDetermination:", a4);
  return v6;
}

@end
