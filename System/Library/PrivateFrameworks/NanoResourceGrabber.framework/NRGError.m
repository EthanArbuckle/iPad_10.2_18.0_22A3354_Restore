@implementation NRGError

+ (id)errorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) NanoResourceGrabber cannot connect to service"), CFSTR("NRGErrorCannotConnect"));
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) No NanoResourceGrabber proxy returned"), CFSTR("NRGErrorNoProxy"));
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) Not yet implemented"), CFSTR("NRGErrorNotImplemented"));
      goto LABEL_10;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) No paired device"), CFSTR("NRGErrorNoPairedDevice"));
      goto LABEL_10;
    case 4:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) Request timed out"), CFSTR("NRGErrorTimedOut"));
      goto LABEL_10;
    case 5:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) Request already pending"), CFSTR("NRGErrorRequestAlreadyPending"));
      goto LABEL_10;
    case 6:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@) No data returned for request"), CFSTR("NRGErrorNoData"));
LABEL_10:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  v5 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NanoResourceGrabber"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
