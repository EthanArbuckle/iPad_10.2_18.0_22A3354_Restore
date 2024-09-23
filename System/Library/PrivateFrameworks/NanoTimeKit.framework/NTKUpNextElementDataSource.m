@implementation NTKUpNextElementDataSource

- (id)supportedSections
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D84408];
  v5[0] = *MEMORY[0x1E0D843D8];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0D84400];
  v5[2] = *MEMORY[0x1E0D843A0];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(int64_t)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, MEMORY[0x1E0C9AA60]);
}

@end
