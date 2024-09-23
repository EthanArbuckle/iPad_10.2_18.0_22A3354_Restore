@implementation OS_nw_channel

- (void)dealloc
{
  Class isa;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  NSObject *v8;
  Class v9;
  objc_super v10;

  while (1)
  {
    isa = self[36].super.super.isa;
    if (!isa)
      break;
    v4 = *((_QWORD *)isa + 2);
    v5 = (objc_class *)*((_QWORD *)isa + 3);
    if (v4)
    {
      *(_QWORD *)(v4 + 24) = v5;
      v5 = (objc_class *)*((_QWORD *)isa + 3);
    }
    else
    {
      self[37].super.super.isa = v5;
    }
    *(_QWORD *)v5 = v4;
    *((_QWORD *)isa + 2) = 0;
    *((_QWORD *)isa + 3) = 0;
    os_release(isa);
  }
  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[40]);
  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[38]);
  v7 = (os_unfair_lock_s *)self[35].super.super.isa;
  if (v7)
  {
    _nw_hash_table_release(v7, v6);
    self[35].super.super.isa = 0;
  }
  nw_channel_close((uint64_t)self, v6);
  v8 = self[26].super.super.isa;
  if (v8)
  {
    dispatch_release(v8);
    self[26].super.super.isa = 0;
  }
  v9 = self[19].super.super.isa;
  if (v9)
  {
    os_release(v9);
    self[19].super.super.isa = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)OS_nw_channel;
  -[OS_nw_channel dealloc](&v10, sel_dealloc);
}

@end
