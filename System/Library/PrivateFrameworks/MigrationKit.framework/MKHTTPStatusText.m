@implementation MKHTTPStatusText

- (MKHTTPStatusText)init
{
  MKHTTPStatusText *v2;
  uint64_t v3;
  NSDictionary *statusTexts;
  objc_super v6;
  _QWORD v7[63];
  _QWORD v8[64];

  v8[63] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)MKHTTPStatusText;
  v2 = -[MKHTTPStatusText init](&v6, sel_init);
  if (v2)
  {
    v7[0] = &unk_24E36B7D8;
    v7[1] = &unk_24E36B7F0;
    v8[0] = CFSTR("Continue");
    v8[1] = CFSTR("Switching Protocols");
    v7[2] = &unk_24E36B808;
    v7[3] = &unk_24E36B820;
    v8[2] = CFSTR("Processing");
    v8[3] = CFSTR("Early Hints");
    v7[4] = &unk_24E36B838;
    v7[5] = &unk_24E36B850;
    v8[4] = CFSTR("OK");
    v8[5] = CFSTR("Created");
    v7[6] = &unk_24E36B868;
    v7[7] = &unk_24E36B880;
    v8[6] = CFSTR("Accepted");
    v8[7] = CFSTR("Non-Authoritative Information");
    v7[8] = &unk_24E36B898;
    v7[9] = &unk_24E36B8B0;
    v8[8] = CFSTR("No Content");
    v8[9] = CFSTR("Reset Content");
    v7[10] = &unk_24E36B8C8;
    v7[11] = &unk_24E36B8E0;
    v8[10] = CFSTR("Partial Content");
    v8[11] = CFSTR("Multi-Status");
    v7[12] = &unk_24E36B8F8;
    v7[13] = &unk_24E36B910;
    v8[12] = CFSTR("Already Reported");
    v8[13] = CFSTR("IM Used");
    v7[14] = &unk_24E36B928;
    v7[15] = &unk_24E36B940;
    v8[14] = CFSTR("Multiple Choices");
    v8[15] = CFSTR("Moved Permanently");
    v7[16] = &unk_24E36B958;
    v7[17] = &unk_24E36B970;
    v8[16] = CFSTR("Found");
    v8[17] = CFSTR("See Other");
    v7[18] = &unk_24E36B988;
    v7[19] = &unk_24E36B9A0;
    v8[18] = CFSTR("Not Modified");
    v8[19] = CFSTR("Use Proxy");
    v7[20] = &unk_24E36B9B8;
    v7[21] = &unk_24E36B9D0;
    v8[20] = CFSTR("Switch Proxy");
    v8[21] = CFSTR("Temporary Redirect");
    v7[22] = &unk_24E36B9E8;
    v7[23] = &unk_24E36BA00;
    v8[22] = CFSTR("Permanent Redirect");
    v8[23] = CFSTR("Bad Request");
    v7[24] = &unk_24E36BA18;
    v7[25] = &unk_24E36BA30;
    v8[24] = CFSTR("Unauthorized");
    v8[25] = CFSTR("Payment Required");
    v7[26] = &unk_24E36BA48;
    v7[27] = &unk_24E36BA60;
    v8[26] = CFSTR("Forbidden");
    v8[27] = CFSTR("Not Found");
    v7[28] = &unk_24E36BA78;
    v7[29] = &unk_24E36BA90;
    v8[28] = CFSTR("Method Not Allowed");
    v8[29] = CFSTR("Not Acceptable");
    v7[30] = &unk_24E36BAA8;
    v7[31] = &unk_24E36BAC0;
    v8[30] = CFSTR("Proxy Authentication Required");
    v8[31] = CFSTR("Request Timeout");
    v7[32] = &unk_24E36BAD8;
    v7[33] = &unk_24E36BAF0;
    v8[32] = CFSTR("Conflict");
    v8[33] = CFSTR("Gone");
    v7[34] = &unk_24E36BB08;
    v7[35] = &unk_24E36BB20;
    v8[34] = CFSTR("Length Required");
    v8[35] = CFSTR("Precondition Failed");
    v7[36] = &unk_24E36BB38;
    v7[37] = &unk_24E36BB50;
    v8[36] = CFSTR("Request Entity Too Large");
    v8[37] = CFSTR("Request URI Too Long");
    v7[38] = &unk_24E36BB68;
    v7[39] = &unk_24E36BB80;
    v8[38] = CFSTR("Unsupported Media Type");
    v8[39] = CFSTR("Requested Range Not Satisfiable");
    v7[40] = &unk_24E36BB98;
    v7[41] = &unk_24E36BBB0;
    v8[40] = CFSTR("Expectation Failed");
    v8[41] = CFSTR("I'm a teapot");
    v7[42] = &unk_24E36BBC8;
    v7[43] = &unk_24E36BBE0;
    v8[42] = CFSTR("Misdirected Request");
    v8[43] = CFSTR("Unprocessable Entity");
    v7[44] = &unk_24E36BBF8;
    v7[45] = &unk_24E36BC10;
    v8[44] = CFSTR("Locked");
    v8[45] = CFSTR("Failed Dependency");
    v7[46] = &unk_24E36BC28;
    v7[47] = &unk_24E36BC40;
    v8[46] = CFSTR("Too Early");
    v8[47] = CFSTR("Upgrade Required");
    v7[48] = &unk_24E36BC58;
    v7[49] = &unk_24E36BC70;
    v8[48] = CFSTR("Precondition Required");
    v8[49] = CFSTR("Too Many Requests");
    v7[50] = &unk_24E36BC88;
    v7[51] = &unk_24E36BCA0;
    v8[50] = CFSTR("Request Header Fields Too Large");
    v8[51] = CFSTR("Unavailable For Legal Reasons");
    v7[52] = &unk_24E36BCB8;
    v7[53] = &unk_24E36BCD0;
    v8[52] = CFSTR("Internal Server Error");
    v8[53] = CFSTR("Not Implemented");
    v7[54] = &unk_24E36BCE8;
    v7[55] = &unk_24E36BD00;
    v8[54] = CFSTR("Bad Gateway");
    v8[55] = CFSTR("Service Unavailable");
    v7[56] = &unk_24E36BD18;
    v7[57] = &unk_24E36BD30;
    v8[56] = CFSTR("Gateway Timeout");
    v8[57] = CFSTR("HTTP Version Not Supported");
    v7[58] = &unk_24E36BD48;
    v7[59] = &unk_24E36BD60;
    v8[58] = CFSTR("Variant Also Negotiates");
    v8[59] = CFSTR("Insufficient Storage");
    v7[60] = &unk_24E36BD78;
    v7[61] = &unk_24E36BD90;
    v8[60] = CFSTR("Loop Detected");
    v8[61] = CFSTR("Not Extended");
    v7[62] = &unk_24E36BDA8;
    v8[62] = CFSTR("Network Authentication Required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 63);
    v3 = objc_claimAutoreleasedReturnValue();
    statusTexts = v2->_statusTexts;
    v2->_statusTexts = (NSDictionary *)v3;

  }
  return v2;
}

- (id)statusText:(unint64_t)a3
{
  NSDictionary *statusTexts;
  void *v4;
  void *v5;

  statusTexts = self->_statusTexts;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](statusTexts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __34__MKHTTPStatusText_sharedInstance__block_invoke()
{
  MKHTTPStatusText *v0;
  void *v1;

  v0 = objc_alloc_init(MKHTTPStatusText);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (id)statusText:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[MKHTTPStatusText sharedInstance](MKHTTPStatusText, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusText:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTexts, 0);
}

@end
