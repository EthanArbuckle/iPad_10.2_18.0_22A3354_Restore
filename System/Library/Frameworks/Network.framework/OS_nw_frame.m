@implementation OS_nw_frame

- (void)dealloc
{
  Class isa;
  int v4;
  OS_nw_frame *v5;
  OS_nw_frame *v6;
  Class v7;
  Class v8;
  objc_class *v9;
  Class v10;
  objc_super v11;

  self[10].super.super.isa = 0;
  self[11].super.super.isa = 0;
  isa = self[12].super.super.isa;
  if (isa)
  {
    os_release(isa);
    self[12].super.super.isa = 0;
  }
  v4 = WORD2(self[25].super.super.isa) & 0xFFC7 | (BYTE6(self[25].super.super.isa) << 16);
  WORD2(self[25].super.super.isa) &= 0xFFC7u;
  BYTE6(self[25].super.super.isa) = BYTE2(v4);
  v5 = (OS_nw_frame *)self[8].super.super.isa;
  if (v5)
  {
    do
    {
      v6 = (OS_nw_frame *)v5->super.super.isa;
      v7 = v5[6].super.super.isa;
      v8 = v5->super.super.isa;
      if (v7)
      {
        os_release(v7);
        v5[6].super.super.isa = 0;
        v8 = v5->super.super.isa;
      }
      v9 = v5[1].super.super.isa;
      if (v8)
      {
        *((_QWORD *)v8 + 1) = v9;
        v9 = v5[1].super.super.isa;
      }
      else
      {
        self[9].super.super.isa = v9;
      }
      *(_QWORD *)v9 = v8;
      if (v5 != &self[15])
        free(v5);
      v5 = v6;
    }
    while (v6);
  }
  self[8].super.super.isa = 0;
  self[9].super.super.isa = (Class)&self[8];
  v10 = self[21].super.super.isa;
  if (v10)
    os_release(v10);
  self[23].super.super.isa = 0;
  *(_OWORD *)&self[21].super.super.isa = 0u;
  *(_OWORD *)&self[19].super.super.isa = 0u;
  *(_OWORD *)&self[17].super.super.isa = 0u;
  *(_OWORD *)&self[15].super.super.isa = 0u;
  v11.receiver = self;
  v11.super_class = (Class)OS_nw_frame;
  -[OS_nw_frame dealloc](&v11, sel_dealloc);
}

@end
