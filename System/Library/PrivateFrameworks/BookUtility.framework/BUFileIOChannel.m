@implementation BUFileIOChannel

- (BUFileIOChannel)initWithType:(unint64_t)a3 URL:(id)a4 oflag:(int)a5 mode:(unsigned __int16)a6 error:(id *)a7 cleanupHandler:(id)a8
{
  unsigned int v10;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  BUFileIOChannel *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  dispatch_fd_t v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *ioQueue;
  NSObject *v32;
  dispatch_io_t v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  BUFileIOChannel *v41;
  uint64_t v43;
  void *v44;
  int *v45;
  const char *v46;
  NSObject *v47;
  int *v48;
  char *v49;
  int *v50;
  void *v51;
  _BOOL4 v52;
  const char *v53;
  id v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void (**v59)(_QWORD, _QWORD);
  _QWORD cleanup_handler[4];
  id v61;
  dispatch_fd_t v62;
  _QWORD v63[4];
  id v64;
  _QWORD *v65;
  _QWORD v66[3];
  char v67;
  objc_super v68;
  uint8_t buf[4];
  BUFileIOChannel *v70;
  __int16 v71;
  dispatch_fd_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v10 = a6;
  v77 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v17 = a8;
  if (!v14 || (objc_msgSend_isFileURL(v14, v15, v16) & 1) == 0)
  {
    if (a7)
    {
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x24BDD1540], v15, 2, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = MEMORY[0x2199A7288](v17);
    v40 = (void *)v39;
    if (v39)
      (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v39, 2);

    goto LABEL_17;
  }
  v68.receiver = self;
  v68.super_class = (Class)BUFileIOChannel;
  v19 = -[BUFileIOChannel init](&v68, sel_init);
  if (!v19)
  {
    if (a7)
    {
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x24BDD1540], v18, 12, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v43 = MEMORY[0x2199A7288](v17);
    self = (BUFileIOChannel *)v43;
    if (v43)
      (*(void (**)(uint64_t, uint64_t))(v43 + 16))(v43, 12);
LABEL_17:
    v41 = 0;
    goto LABEL_18;
  }
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v67 = 0;
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = sub_212E606C8;
  v63[3] = &unk_24CEDA7F0;
  v65 = v66;
  v20 = v17;
  v64 = v20;
  v59 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](v63);
  objc_msgSend_path(v14, v21, v22);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (const char *)objc_msgSend_fileSystemRepresentation(v23, v24, v25);

  if (v26)
  {
    if ((a5 & 0x400) != 0)
      unlink(v26);
    v29 = open(v26, a5, v10);
    if (v29 < 0)
    {
      v44 = (void *)MEMORY[0x24BDD1540];
      v45 = __error();
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v44, v46, *v45, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      BUZipLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = __error();
        v49 = strerror(*v48);
        sub_212E6D16C((uint64_t)v49, buf, (uint64_t)v26, v47);
      }

      v50 = __error();
      v59[2](v59, *v50);
      goto LABEL_26;
    }
    v30 = dispatch_queue_create("BUFileIOChannel.IO", 0);
    ioQueue = v19->_ioQueue;
    v19->_ioQueue = (OS_dispatch_queue *)v30;

    v32 = v19->_ioQueue;
    cleanup_handler[0] = MEMORY[0x24BDAC760];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_212E60734;
    cleanup_handler[3] = &unk_24CEDA818;
    v62 = v29;
    v61 = v20;
    v33 = dispatch_io_create(a3, v29, v32, cleanup_handler);
    objc_msgSend_setChannel_(v19, v34, (uint64_t)v33);

    BUZipLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_channel(v19, v36, v37);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v14, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v70 = v19;
      v71 = 1024;
      v72 = v29;
      v73 = 2112;
      v74 = v55;
      v75 = 2112;
      v76 = v58;
      _os_log_debug_impl(&dword_212E45000, v35, OS_LOG_TYPE_DEBUG, "%@: initWithType:URL:oflag:mode:, fd = %d, self.channel = %@, URL = %@", buf, 0x26u);

    }
  }
  v38 = 0;
LABEL_26:
  objc_msgSend_channel(v19, v27, v28);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == 0;

  if (v52)
  {
    if (a7)
    {
      if (v38)
      {
        *a7 = objc_retainAutorelease(v38);
      }
      else
      {
        objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x24BDD1540], v53, 2, 0);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a7 = v54;

      }
    }
    v59[2](v59, 2);

    v19 = 0;
  }
  self = v19;

  _Block_object_dispose(v66, 8);
  v41 = self;
LABEL_18:

  return v41;
}

- (id)initForReadingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_initForReadingURL_error_cleanupHandler_, a3);
}

- (id)initForReadingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (id)initForReadingDescriptor:(int)a3 queue:(id)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithType_descriptor_queue_cleanupHandler_, 1);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_initForStreamWritingURL_error_cleanupHandler_, a3);
}

- (id)initForStreamWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_initForRandomWritingURL_error_cleanupHandler_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)initForRandomWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_initForRandomReadingWritingURL_error_cleanupHandler_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)initForRandomReadingWritingURL:(id)a3 error:(id *)a4 cleanupHandler:(id)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithType_URL_oflag_mode_error_cleanupHandler_, 1);
}

- (BUFileIOChannel)initWithType:(unint64_t)a3 descriptor:(int)a4 queue:(id)a5 cleanupHandler:(id)a6
{
  id v10;
  id v11;
  BUFileIOChannel *v12;
  BUFileIOChannel *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *ioQueue;
  NSObject *v16;
  dispatch_io_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  BUFileIOChannel *v22;
  NSObject *v23;
  BUFileIOChannel *v24;
  _QWORD cleanup_handler[4];
  id v27;
  NSObject *v28;
  _QWORD block[4];
  BUFileIOChannel *v30;
  objc_super v31;

  v10 = a5;
  v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BUFileIOChannel;
  v12 = -[BUFileIOChannel init](&v31, sel_init);
  if (v12)
  {
    v13 = v12;
    v14 = dispatch_queue_create("BUFileIOChannel.IO", 0);
    ioQueue = v13->_ioQueue;
    v13->_ioQueue = (OS_dispatch_queue *)v14;

    v16 = v13->_ioQueue;
    cleanup_handler[0] = MEMORY[0x24BDAC760];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = sub_212E60A3C;
    cleanup_handler[3] = &unk_24CEDA868;
    v28 = v11;
    v27 = v10;
    v17 = dispatch_io_create(a3, a4, v16, cleanup_handler);
    objc_msgSend_setChannel_(v13, v18, (uint64_t)v17);

    objc_msgSend_channel(v13, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {

      v13 = 0;
    }
    v22 = v13;

    v23 = v28;
    v24 = v22;
    goto LABEL_11;
  }
  v22 = (BUFileIOChannel *)MEMORY[0x2199A7288](v11);
  if (v22)
  {
    v23 = v10;
    if (v23)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_212E60A2C;
      block[3] = &unk_24CED9B90;
      v22 = v22;
      v30 = v22;
      dispatch_async(v23, block);

    }
    else
    {
      ((void (*)(BUFileIOChannel *, uint64_t))v22->_ioQueue)(v22, 12);
    }
    v24 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v24 = 0;
LABEL_12:

  return v24;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v10;

  if ((objc_msgSend_isClosed(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_channel(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend_channel(self, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_io_close(v9, 0);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BUFileIOChannel;
  -[BUFileIOChannel dealloc](&v10, sel_dealloc);
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *ioQueue;
  id v13;
  _QWORD io_handler[4];
  id v15;

  v8 = a5;
  objc_msgSend_channel(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_212E60C68;
  io_handler[3] = &unk_24CEDA890;
  v15 = v8;
  v13 = v8;
  dispatch_io_read(v11, a3, a4, ioQueue, io_handler);

}

- (void)readWithHandler:(id)a3
{
  objc_msgSend_readFromOffset_length_handler_(self, a2, 0, -1, a3);
}

- (void)writeData:(id)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *ioQueue;
  id v12;
  _QWORD io_handler[4];
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_channel(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_212E60DB4;
  io_handler[3] = &unk_24CEDA890;
  v14 = v6;
  v12 = v6;
  dispatch_io_write(v10, 0, v7, ioQueue, io_handler);

}

- (void)writeData:(id)a3 offset:(int64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *ioQueue;
  id v14;
  _QWORD io_handler[4];
  id v16;

  v8 = a5;
  v9 = a3;
  objc_msgSend_channel(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  ioQueue = self->_ioQueue;
  io_handler[0] = MEMORY[0x24BDAC760];
  io_handler[1] = 3221225472;
  io_handler[2] = sub_212E60F08;
  io_handler[3] = &unk_24CEDA890;
  v16 = v8;
  v14 = v8;
  dispatch_io_write(v12, a4, v9, ioQueue, io_handler);

}

- (void)close
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;

  if ((objc_msgSend_isClosed(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_channel(self, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_io_close(v6, 0);

  }
  objc_msgSend_setClosed_(self, v4, 1);
}

- (void)setLowWater:(unint64_t)a3
{
  NSObject *v4;

  objc_msgSend_channel(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_io_set_low_water(v4, a3);

}

- (void)addBarrier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend_channel(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_io_barrier(v7, v4);

}

- (void)flushWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_channel(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212E61100;
  v9[3] = &unk_24CED9D20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_io_barrier(v7, v9);

}

- (void)truncateToLength:(int64_t)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD barrier[5];
  id v12;
  int64_t v13;

  v6 = a4;
  objc_msgSend_channel(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  barrier[0] = MEMORY[0x24BDAC760];
  barrier[1] = 3221225472;
  barrier[2] = sub_212E61254;
  barrier[3] = &unk_24CED9EA0;
  v12 = v6;
  v13 = a3;
  barrier[4] = self;
  v10 = v6;
  dispatch_io_barrier(v9, barrier);

}

- (BOOL)isValid
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v7;
  dispatch_fd_t descriptor;
  char v9;

  if ((objc_msgSend_isClosed(self, a2, v2) & 1) != 0)
    return 0;
  objc_msgSend_channel(self, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  descriptor = dispatch_io_get_descriptor(v7);

  v9 = 0;
  return read(descriptor, &v9, 0) == 0;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ioQueue, a3);
}

- (OS_dispatch_io)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end
