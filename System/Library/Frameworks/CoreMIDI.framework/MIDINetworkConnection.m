@implementation MIDINetworkConnection

- (MIDINetworkConnection)init
{
  MIDINetworkConnection *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIDINetworkConnection;
  v2 = -[MIDINetworkConnection init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v2->_imp = v3;
  }
  return v2;
}

- (void)dealloc
{
  id *imp;
  objc_super v4;

  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1D826BA98](imp, 0x80C40B8603338);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkConnection;
  -[MIDINetworkConnection dealloc](&v4, sel_dealloc);
}

- (MIDINetworkHost)host
{
  return (MIDINetworkHost *)*(id *)self->_imp;
}

+ (MIDINetworkConnection)connectionWithHost:(MIDINetworkHost *)host
{
  MIDINetworkHost *v3;
  MIDINetworkConnection *v4;
  void **imp;
  void *v6;

  v3 = host;
  v4 = objc_alloc_init(MIDINetworkConnection);
  imp = (void **)v4->_imp;
  v6 = *imp;
  *imp = v3;

  return v4;
}

@end
