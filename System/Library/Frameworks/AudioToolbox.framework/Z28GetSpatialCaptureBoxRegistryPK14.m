@implementation Z28GetSpatialCaptureBoxRegistryPK14

DSPGraph::Box *___Z28GetSpatialCaptureBoxRegistryPK14__CFDictionaryj_block_invoke_2(uint64_t a1, int a2, int a3)
{
  DSPGraph::Box *v3;

  if (a2 != 1 || a3 != 1)
    __assert_rtn("GetSpatialCaptureBoxRegistry_block_invoke_2", "SpatialCapture.mm", 528, "numInputs == 1 && numOutputs == 1 && \"Bad number of ins or outs\");
  v3 = (DSPGraph::Box *)operator new();
  DSPGraph::Box::Box(v3);
  *(_QWORD *)v3 = &off_1E69D9B88;
  *((_QWORD *)v3 + 97) = 0;
  *((_QWORD *)v3 + 99) = 0;
  *((_QWORD *)v3 + 98) = 0;
  return v3;
}

@end
