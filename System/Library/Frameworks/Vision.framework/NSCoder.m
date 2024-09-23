@implementation NSCoder

void __49__NSCoder_VNAdditions__vn_decodeTimeRangeForKey___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSet;
  -[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSet = v3;

}

float __74__NSCoder_VNAdditions___vn_decodeSimdFloat3FromDataRepresentation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *(_DWORD *)a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 36) = *(_DWORD *)(a2 + 4);
  result = *(float *)(a2 + 8);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

float __73__NSCoder_VNAdditions___vn_decode4x4MatrixFromDataRepresentation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_DWORD *)a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 60) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 68) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 76) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 84) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 92) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 100) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104) = *(_DWORD *)(a2 + 56);
  result = *(float *)(a2 + 60);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 108) = result;
  return result;
}

float __73__NSCoder_VNAdditions___vn_decode3x3MatrixFromDataRepresentation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_DWORD *)a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 68) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 84) = *(_DWORD *)(a2 + 28);
  result = *(float *)(a2 + 32);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) = result;
  return result;
}

@end
