@implementation C2MultipeerServerContext

- (C2MultipeerServerContext)init
{
  C2MultipeerServerContext *v2;
  os_activity_t v3;
  OS_os_activity *osActivity;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)C2MultipeerServerContext;
  v2 = -[C2MultipeerServerContext init](&v6, sel_init);
  if (v2)
  {
    v3 = _os_activity_create(&dword_1D4DC3000, "c2-chunk-server", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v3;

  }
  return v2;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_osActivity, a3);
}

- (NSData)chunkData
{
  return self->_chunkData;
}

- (void)setChunkData:(id)a3
{
  objc_storeStrong((id *)&self->_chunkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkData, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
}

@end
