@implementation BloodhoundPacketDumper

- (BloodhoundPacketDumper)initWithFileName:(id)a3
{
  id v4;
  BloodhoundPacketDumper *v5;
  pcap_t *v6;
  uint64_t v7;
  NSString *fileName;
  pcap_dumper_t *v9;
  BloodhoundPacketDumper *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BloodhoundPacketDumper;
  v5 = -[BloodhoundPacketDumper init](&v12, sel_init);
  if (v5)
  {
    v6 = pcap_open_dead(157, 0x80000);
    v5->_pcap = v6;
    if (!v6
      || (objc_msgSend(v4, "stringByExpandingTildeInPath"),
          v7 = objc_claimAutoreleasedReturnValue(),
          fileName = v5->_fileName,
          v5->_fileName = (NSString *)v7,
          fileName,
          v9 = pcap_dump_open(v5->_pcap, -[NSString UTF8String](v5->_fileName, "UTF8String")),
          (v5->_dumper = v9) == 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    pcap_dump_flush(v9);
  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (BloodhoundPacketDumper)initWithDumper:(pcap_dumper *)a3
{
  BloodhoundPacketDumper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BloodhoundPacketDumper;
  result = -[BloodhoundPacketDumper init](&v5, sel_init);
  if (result)
  {
    result->_dumper = a3;
    result->_externalDumper = 1;
  }
  return result;
}

- (void)dealloc
{
  pcap *pcap;
  pcap_dumper *dumper;
  objc_super v5;

  pcap = self->_pcap;
  if (pcap)
    pcap_close(pcap);
  dumper = self->_dumper;
  if (dumper && !self->_externalDumper)
    pcap_dump_close(dumper);
  v5.receiver = self;
  v5.super_class = (Class)BloodhoundPacketDumper;
  -[BloodhoundPacketDumper dealloc](&v5, sel_dealloc);
}

- (void)dumpPacket:(id)a3 type:(unsigned int)a4 metadata:(void *)a5 metadataLength:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  pcap_dumper *dumper;
  id v13;
  pcap_pkthdr v14;
  uint64_t v15;

  v8 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendLittleInt32:", v8);
  if (a5)
    objc_msgSend(v11, "appendBytes:length:", a5, a6);
  if (v10)
    objc_msgSend(v11, "appendData:", v10);
  memset(&v14, 0, sizeof(v14));
  gettimeofday(&v14.ts, 0);
  v14.caplen = objc_msgSend(v11, "length");
  v14.len = objc_msgSend(v11, "length");
  dumper = self->_dumper;
  v13 = objc_retainAutorelease(v11);
  pcap_dump((u_char *)dumper, &v14, (const u_char *)objc_msgSend(v13, "bytes"));
  pcap_dump_flush(self->_dumper);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
