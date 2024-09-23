@implementation Z37writeAccelerationStructureToGBVH5PathPN33AccelerationStructureViewerServer10DataSourceEP18ASVCameraTransformP18ASVSRenderSettingsP8NSStringPU15

_QWORD *___Z37writeAccelerationStructureToGBVH5PathPN33AccelerationStructureViewerServer10DataSourceEP18ASVCameraTransformP18ASVSRenderSettingsP8NSStringPU15__autoreleasingP7NSError_block_invoke_2(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  unsigned int i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD *v18;

  v2 = *a2;
  if (a2[1] != *a2)
  {
    v4 = result;
    v5 = 0;
    for (i = 1; ; ++i)
    {
      v7 = v2 + 32 * v5;
      v8 = objc_msgSend((id)v4[4], "offsetInFile");
      v9 = v4[5];
      v10 = (_QWORD *)(v9 + 24 * v5);
      v11 = *(void **)(v7 + 8);
      v12 = *(_QWORD *)(v7 + 16);
      *v10 = v8;
      v10[1] = v12;
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 30));
        *(_DWORD *)(v4[5] + 24 * v5 + 16) = objc_msgSend(v13, "length");
        objc_msgSend((id)v4[4], "writeData:", v13);

        v9 = v4[5];
      }
      else
      {
        *(_DWORD *)(v9 + 24 * v5 + 16) = 0;
      }
      *(_DWORD *)(v9 + 24 * v5 + 20) = *(_QWORD *)(v2 + 32 * v5 + 24);
      v14 = v4[6];
      v15 = (id)v4[4];
      v17[0] = off_7273D8;
      v17[1] = v15;
      v18 = v17;
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v14 + 112))(v14, v7, v17);
      result = v18;
      if (v18 == v17)
        break;
      if (v18)
      {
        v16 = 5;
LABEL_10:
        result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v16))();
      }
      v5 = i;
      v2 = *a2;
      if (v5 >= (a2[1] - *a2) >> 5)
        return result;
    }
    result = v17;
    v16 = 4;
    goto LABEL_10;
  }
  return result;
}

@end
