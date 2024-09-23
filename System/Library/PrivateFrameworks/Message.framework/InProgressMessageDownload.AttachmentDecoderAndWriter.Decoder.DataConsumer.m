@implementation InProgressMessageDownload.AttachmentDecoderAndWriter.Decoder.DataConsumer

- (int64_t)appendData:(id)a3
{
  id v3;
  _TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer *v4;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v8 = sub_1A5949F90();
    v9 = v5;

    v10 = v8;
    v11 = v9;
  }
  else
  {
    v10 = 0;
    v11 = 0xF000000000000000;
  }
  v7 = sub_1A51A9B20(v10, v11);
  sub_1A5172684(v10, v11);

  return v7;
}

- (void)done
{
  _TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer *v2;

  v2 = self;
  sub_1A51A9D68();

}

- (_TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer)init
{
  return (_TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer *)sub_1A51A9E5C();
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
