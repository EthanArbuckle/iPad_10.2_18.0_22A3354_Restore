@implementation DTSysmonTapMemo

- (NSArray)samples
{
  return *(NSArray **)&self->super._supportsPeek;
}

- (void)setSamples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._supportsPeek, 0);
}

@end
