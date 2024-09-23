@implementation ZN3AGX11BlitContextINS

uint64_t *___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_3_191(uint64_t a1, _QWORD *a2)
{
  return AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyBufferToBuffer(*(uint64_t **)(a1 + 48), *(char **)(a1 + 32), *a2 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE51650] + 72), *(char **)(a1 + 40), a2[1] - *(_QWORD *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE51650] + 72), a2[2]);
}

@end
