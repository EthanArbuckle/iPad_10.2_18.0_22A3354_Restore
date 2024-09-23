@implementation CMPhotoAsyncDispatcherGetTypeID

uint64_t __CMPhotoAsyncDispatcherGetTypeID_block_invoke()
{
  uint64_t result;

  FigKTraceInit();
  sCMPhotoAsyncDispatcherClass = 0;
  unk_1EE999FD0 = "CMPhotoDNGCompressor";
  qword_1EE999FD8 = (uint64_t)_dispatcherClass_Init;
  unk_1EE999FE0 = 0;
  qword_1EE999FE8 = (uint64_t)_dispatcherClass_Finalize;
  unk_1EE999FF0 = 0;
  qword_1EE999FF8 = 0;
  unk_1EE99A000 = _dispatcherClass_CopyFormattingDesc;
  qword_1EE99A008 = (uint64_t)_dispatcherClass_CopyDebugDesc;
  result = _CFRuntimeRegisterClass();
  sCMPhotoAsyncDispatcherTypeID = result;
  return result;
}

@end
