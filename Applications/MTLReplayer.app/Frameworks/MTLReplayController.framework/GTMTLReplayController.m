@implementation GTMTLReplayController

id __GTMTLReplayController_defaultDispatchFunction_noPinning_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "length");
}

id __GTMTLReplayController_generateWireframeTexture_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "device");
}

void __GTMTLReplayController_init_block_invoke(id a1, unint64_t a2, const char *a3, unsigned int a4, NSString *a5)
{
  uint64_t v5;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  id NSError;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  if ((((unint64_t)qword_753120 >> a2) & 1) != 0)
  {
    v5 = *(_QWORD *)&a4;
    v13[0] = CFSTR("GTErrorKeyFile");
    v7 = a5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
    v14[0] = v8;
    v13[1] = CFSTR("GTErrorKeyLine");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
    v14[1] = v9;
    v14[2] = CFSTR("The replayer encountered a Metal validation layer error.");
    v13[2] = NSLocalizedDescriptionKey;
    v13[3] = NSLocalizedFailureReasonErrorKey;
    v14[3] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));

    NSError = MakeNSError(200, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue(NSError);

    GTMTLReplay_handleNSError(v12);
  }
}

@end
