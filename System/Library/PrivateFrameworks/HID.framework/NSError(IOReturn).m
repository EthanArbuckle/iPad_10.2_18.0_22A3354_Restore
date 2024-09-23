@implementation NSError(IOReturn)

+ (id)errorWithIOReturn:()IOReturn
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  _QWORD v12[50];
  _QWORD v13[51];

  v13[50] = *MEMORY[0x1E0C80C00];
  v12[0] = &unk_1E94E9448;
  v12[1] = &unk_1E94E9460;
  v13[0] = CFSTR("success");
  v13[1] = CFSTR("general error");
  v12[2] = &unk_1E94E9478;
  v12[3] = &unk_1E94E9490;
  v13[2] = CFSTR("memory allocation error");
  v13[3] = CFSTR("resource shortage");
  v12[4] = &unk_1E94E94A8;
  v12[5] = &unk_1E94E94C0;
  v13[4] = CFSTR("Mach IPC failure");
  v13[5] = CFSTR("no such device");
  v12[6] = &unk_1E94E94D8;
  v12[7] = &unk_1E94E94F0;
  v13[6] = CFSTR("privilege violation");
  v13[7] = CFSTR("invalid argument");
  v12[8] = &unk_1E94E9508;
  v12[9] = &unk_1E94E9520;
  v13[8] = CFSTR("device is read locked");
  v13[9] = CFSTR("device is write locked");
  v12[10] = &unk_1E94E9538;
  v12[11] = &unk_1E94E9550;
  v13[10] = CFSTR("device is exclusive access");
  v13[11] = CFSTR("bad IPC message ID");
  v12[12] = &unk_1E94E9568;
  v12[13] = &unk_1E94E9580;
  v13[12] = CFSTR("unsupported function");
  v13[13] = CFSTR("virtual memory error");
  v12[14] = &unk_1E94E9598;
  v12[15] = &unk_1E94E95B0;
  v13[14] = CFSTR("internal driver error");
  v13[15] = CFSTR("I/O error");
  v12[16] = &unk_1E94E95C8;
  v12[17] = &unk_1E94E95E0;
  v13[16] = CFSTR("cannot acquire lock");
  v13[17] = CFSTR("device is not open");
  v12[18] = &unk_1E94E95F8;
  v12[19] = &unk_1E94E9610;
  v13[18] = CFSTR("device is not readable");
  v13[19] = CFSTR("device is not writeable");
  v12[20] = &unk_1E94E9628;
  v12[21] = &unk_1E94E9640;
  v13[20] = CFSTR("alignment error");
  v13[21] = CFSTR("media error");
  v12[22] = &unk_1E94E9658;
  v12[23] = &unk_1E94E9670;
  v13[22] = CFSTR("device is still open");
  v13[23] = CFSTR("rld failure");
  v12[24] = &unk_1E94E9688;
  v12[25] = &unk_1E94E96A0;
  v13[24] = CFSTR("DMA failure");
  v13[25] = CFSTR("device is busy");
  v12[26] = &unk_1E94E96B8;
  v12[27] = &unk_1E94E96D0;
  v13[26] = CFSTR("I/O timeout");
  v13[27] = CFSTR("device is offline");
  v12[28] = &unk_1E94E96E8;
  v12[29] = &unk_1E94E9700;
  v13[28] = CFSTR("device is not ready");
  v13[29] = CFSTR("device/channel is not attached");
  v12[30] = &unk_1E94E9718;
  v12[31] = &unk_1E94E9730;
  v13[30] = CFSTR("no DMA channels available");
  v13[31] = CFSTR("no space for data");
  v12[32] = &unk_1E94E9748;
  v12[33] = &unk_1E94E9760;
  v13[32] = CFSTR("device port already exists");
  v13[33] = CFSTR("cannot wire physical memory");
  v12[34] = &unk_1E94E9778;
  v12[35] = &unk_1E94E9790;
  v13[34] = CFSTR("no interrupt attached");
  v13[35] = CFSTR("no DMA frames enqueued");
  v12[36] = &unk_1E94E97A8;
  v12[37] = &unk_1E94E97C0;
  v13[36] = CFSTR("message is too large");
  v13[37] = CFSTR("operation is not permitted");
  v12[38] = &unk_1E94E97D8;
  v12[39] = &unk_1E94E97F0;
  v13[38] = CFSTR("device is without power");
  v13[39] = CFSTR("media is not present");
  v12[40] = &unk_1E94E9808;
  v12[41] = &unk_1E94E9820;
  v13[40] = CFSTR("media is not formatted");
  v13[41] = CFSTR("unsupported mode");
  v12[42] = &unk_1E94E9838;
  v12[43] = &unk_1E94E9850;
  v13[42] = CFSTR("data underrun");
  v13[43] = CFSTR("data overrun");
  v12[44] = &unk_1E94E9868;
  v12[45] = &unk_1E94E9880;
  v13[44] = CFSTR("device error");
  v13[45] = CFSTR("no completion routine");
  v12[46] = &unk_1E94E9898;
  v12[47] = &unk_1E94E98B0;
  v13[46] = CFSTR("operation was aborted");
  v13[47] = CFSTR("bus bandwidth would be exceeded");
  v12[48] = &unk_1E94E98C8;
  v12[49] = &unk_1E94E98E0;
  v13[48] = CFSTR("device is not responding");
  v13[49] = CFSTR("unanticipated driver error");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x unknown"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *MEMORY[0x1E0CB2D50];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HIDFramework"), (int)a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
