@implementation ZN5H9ISP22H9ISPPhotometerManagerD2Ev

AudioUnit *___ZN5H9ISP22H9ISPPhotometerManagerD2Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;
  AudioUnit *result;

  v1 = *(_QWORD *)(a1 + 32);
  H9ISPFlickerDetectorRegisterDataCollectionCallback(0, 0, 0);
  *(_QWORD *)v1 = 0;
  *(_DWORD *)(v1 + 72) = 1065353216;
  result = *(AudioUnit **)(v1 + 24);
  if (result)
  {
    H9ISPFlickerDetectorStopDataCollection(result);
    result = (AudioUnit *)H9ISPFlickerDetectorDispose(*(_QWORD *)(v1 + 24));
    *(_QWORD *)(v1 + 24) = 0;
  }
  return result;
}

@end
