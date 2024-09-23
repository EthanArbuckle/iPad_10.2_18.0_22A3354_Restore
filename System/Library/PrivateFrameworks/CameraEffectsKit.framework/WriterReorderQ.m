@implementation WriterReorderQ

- (WriterReorderQ)init
{
  WriterReorderQ *v2;
  WriterReorderQ *v3;
  PVFrameSet *frameSet;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WriterReorderQ;
  v2 = -[WriterReorderQ init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    frameSet = v2->_frameSet;
    v2->_frameSet = 0;

    v5 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v3->_lastReorderedTime.value = *MEMORY[0x24BDC0D88];
    v3->_lastReorderedTime.epoch = *(_QWORD *)(v5 + 16);
  }
  return v3;
}

- (id)getReorderedFrameSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int32_t v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CMTime v21;
  CMTime v22;
  CMTime time2;
  CMTime time1;
  CMTime v25;
  CMTime v26;

  v4 = a3;
  memset(&v26, 0, sizeof(v26));
  objc_msgSend(v4, "colorSampleBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "presentationTimeStamp");
  else
    memset(&v26, 0, sizeof(v26));

  if ((v26.flags & 1) == 0)
  {
    JFXLog_DebugWriterReorder();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[WriterReorderQ getReorderedFrameSet:].cold.5();

  }
  -[WriterReorderQ frameSet](self, "frameSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    JFXLog_DebugWriterReorder();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[WriterReorderQ getReorderedFrameSet:].cold.1((uint64_t)&v26);

    -[WriterReorderQ setFrameSet:](self, "setFrameSet:", v4);
    goto LABEL_30;
  }
  memset(&v25, 0, sizeof(v25));
  -[WriterReorderQ frameSet](self, "frameSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorSampleBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "presentationTimeStamp");
  else
    memset(&v25, 0, sizeof(v25));

  time1 = v26;
  time2 = v25;
  v13 = CMTimeCompare(&time1, &time2);
  JFXLog_DebugWriterReorder();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13 < 0)
  {
    if (v15)
      -[WriterReorderQ getReorderedFrameSet:].cold.4((uint64_t)&v26);

    v16 = v4;
  }
  else
  {
    if (v15)
      -[WriterReorderQ getReorderedFrameSet:].cold.3((uint64_t)&v26);

    -[WriterReorderQ frameSet](self, "frameSet");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[WriterReorderQ setFrameSet:](self, "setFrameSet:", v4);
  }
  memset(&time1, 0, sizeof(time1));
  objc_msgSend(v16, "colorSampleBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "presentationTimeStamp");
  else
    memset(&time1, 0, sizeof(time1));

  -[WriterReorderQ lastReorderedTime](self, "lastReorderedTime");
  time2 = time1;
  if (CMTimeCompare(&time2, &v22) < 0)
  {
    JFXLog_DebugWriterReorder();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[WriterReorderQ getReorderedFrameSet:].cold.2();

LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  v21 = time1;
  -[WriterReorderQ setLastReorderedTime:](self, "setLastReorderedTime:", &v21);
LABEL_31:

  return v16;
}

- (id)clearQueuedFrameSet
{
  NSObject *v3;
  void *v4;
  _BYTE v6[24];

  JFXLog_DebugWriterReorder();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[WriterReorderQ clearQueuedFrameSet].cold.1(self, (uint64_t)v6, v3);

  -[WriterReorderQ frameSet](self, "frameSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WriterReorderQ setFrameSet:](self, "setFrameSet:", 0);
  return v4;
}

- (PVFrameSet)frameSet
{
  return self->_frameSet;
}

- (void)setFrameSet:(id)a3
{
  objc_storeStrong((id *)&self->_frameSet, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastReorderedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setLastReorderedTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastReorderedTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastReorderedTime.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSet, 0);
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.1(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Queued first reorder frame:   %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)getReorderedFrameSet:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "WriterQ dropping severely OOO frame to writer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.3(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Queued frame was in order:  %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)getReorderedFrameSet:(uint64_t)a1 .cold.4(uint64_t a1)
{
  CMTime *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  JFXNSStringForCMTime(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "Queued frame was out of order: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)getReorderedFrameSet:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "* invalid time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearQueuedFrameSet
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "frameSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorSampleBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "presentationTimeStamp");
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  JFXNSStringForCMTime((CMTime *)a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, a3, v9, "clearing queued frame:         %@", v10);

}

@end
