@implementation UARPPacketDumper

- (UARPPacketDumper)initWithFileName:(id)a3
{
  id v4;
  UARPPacketDumper *v5;
  BloodhoundPacketDumper *v6;
  BloodhoundPacketDumper *bloodhoundDumper;
  UARPPacketDumper *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UARPPacketDumper;
  v5 = -[UARPPacketDumper init](&v10, sel_init);
  if (v5
    && (v6 = -[BloodhoundPacketDumper initWithFileName:]([BloodhoundPacketDumper alloc], "initWithFileName:", v4), bloodhoundDumper = v5->_bloodhoundDumper, v5->_bloodhoundDumper = v6, bloodhoundDumper, !v5->_bloodhoundDumper))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dump:(id)a3 accessoryID:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  objc_msgSend(a4, "uuid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UARPPacketDumper dump:uuid:uarpStatus:direction:](self, "dump:uuid:uarpStatus:direction:", v10, v11, v7, a6);

}

- (void)dump:(id)a3 uuid:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  char v6;
  id v10;
  __int16 v11;
  _WORD v12[11];
  uint64_t v13;

  v6 = a6;
  v13 = *MEMORY[0x24BDAC8D0];
  memset(&v12[3], 0, 15);
  v10 = a3;
  objc_msgSend(a4, "getUUIDBytes:", v12, 23);
  *(_DWORD *)&v12[8] = a5;
  LOBYTE(v12[10]) = v6;
  -[BloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:](self->_bloodhoundDumper, "dumpPacket:type:metadata:metadataLength:", v10, 3, &v11, 23);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloodhoundDumper, 0);
}

@end
