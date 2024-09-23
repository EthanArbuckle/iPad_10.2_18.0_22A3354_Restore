@implementation _EARLogHelper

+ (void)setCustomQuasarLogLevel:(int)a3
{
  int v3;

  quasar::gLogLevel = a3;
  if (a3 == 5)
    v3 = 1;
  else
    v3 = 5;
  if (a3 == 4)
    v3 = 0;
  if ((a3 & 0xFC) == 0)
    v3 = -1;
  kaldi::g_kaldi_verbose_level = v3;
}

@end
