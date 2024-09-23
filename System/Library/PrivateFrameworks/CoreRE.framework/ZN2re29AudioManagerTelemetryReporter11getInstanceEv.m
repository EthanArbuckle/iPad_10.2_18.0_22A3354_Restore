@implementation ZN2re29AudioManagerTelemetryReporter11getInstanceEv

re *___ZN2re29AudioManagerTelemetryReporter11getInstanceEv_block_invoke(re *result)
{
  uint64_t *v1;
  uint64_t v2;
  re *v3;
  uint64_t *v4;
  re::AudioTelemetryReporter *v5;

  if (!re::AudioManagerTelemetryReporter::sharedReporter)
  {
    v1 = re::globalAllocators(result);
    v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v1[2] + 32))(v1[2], 152, 8);
    *(_QWORD *)v2 = 0;
    *(_BYTE *)(v2 + 8) = 0;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_QWORD *)(v2 + 96) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)(v2 + 24) = 0;
    *(_OWORD *)(v2 + 104) = xmmword_226100BF0;
    *(_OWORD *)(v2 + 120) = xmmword_226100C00;
    *(_OWORD *)(v2 + 136) = xmmword_226100C10;
    v3 = (re *)mach_absolute_time();
    *(_QWORD *)v2 = v3;
    v4 = re::globalAllocators(v3);
    v5 = (re::AudioTelemetryReporter *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v4[2] + 32))(v4[2], 48, 8);
    result = re::AudioTelemetryReporter::AudioTelemetryReporter(v5);
    *(_QWORD *)(v2 + 32) = result;
    re::AudioManagerTelemetryReporter::sharedReporter = v2;
  }
  return result;
}

@end
