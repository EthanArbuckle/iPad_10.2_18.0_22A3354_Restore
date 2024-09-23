@implementation C3DSubdivisionOsdGPUGetSharedSources

void __C3DSubdivisionOsdGPUGetSharedSources_block_invoke()
{
  OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource *v0;
  void **v1;
  void *__p[2];
  char v3;

  v0 = (OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource *)objc_alloc(MEMORY[0x1E0CB3940]);
  OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetPatchBasisShaderSource((uint64_t *)__p, v0);
  if (v3 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  C3DSubdivisionOsdGPUGetSharedSources::kSources = -[OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource initWithCString:encoding:](v0, "initWithCString:encoding:", v1, 4);
  if (v3 < 0)
    operator delete(__p[0]);
}

@end
