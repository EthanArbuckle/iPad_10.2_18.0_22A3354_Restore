@implementation ZN2re4ecs228AudioPlayerTelemetryReporter11getInstanceEv

uint64_t *___ZN2re4ecs228AudioPlayerTelemetryReporter11getInstanceEv_block_invoke(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  re::AudioTelemetryReporter *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!re::ecs2::AudioPlayerTelemetryReporter::sharedReporter)
  {
    v1 = re::globalAllocators((re *)result);
    v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v1[2] + 32))(v1[2], 152, 8);
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_QWORD *)(v2 + 48) = 0;
    *(_OWORD *)(v2 + 56) = xmmword_226100BF0;
    *(_OWORD *)(v2 + 72) = xmmword_226100C00;
    *(_OWORD *)(v2 + 88) = xmmword_226100C10;
    *(_QWORD *)(v2 + 104) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    v3 = (_QWORD *)(v2 + 136);
    *(_QWORD *)(v2 + 144) = 0;
    v4 = re::globalAllocators((re *)v2);
    v5 = (re::AudioTelemetryReporter *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v4[2] + 32))(v4[2], 48, 8);
    re::AudioTelemetryReporter::AudioTelemetryReporter(v5);
    v10[0] = v9;
    v8 = 0;
    v9[0] = &off_24ED3F408;
    std::unique_ptr<re::AudioTelemetryReporter,std::function<void ()(re::AudioTelemetryReporter*)>>::reset[abi:ne180100]((uint64_t *)(v2 + 104), (uint64_t)v5);
    v6 = *(_QWORD **)(v2 + 136);
    *(_QWORD *)(v2 + 136) = 0;
    if (v6 == (_QWORD *)(v2 + 112))
    {
      v7 = 4;
      v6 = (_QWORD *)(v2 + 112);
    }
    else
    {
      if (!v6)
        goto LABEL_7;
      v7 = 5;
    }
    (*(void (**)(_QWORD *))(*v6 + 8 * v7))(v6);
LABEL_7:
    if (v10[0])
    {
      if ((_QWORD *)v10[0] == v9)
      {
        *v3 = v2 + 112;
        (*(void (**)(_QWORD *, uint64_t))(v9[0] + 24))(v9, v2 + 112);
        goto LABEL_12;
      }
      *v3 = v10[0];
      v3 = v10;
    }
    *v3 = 0;
LABEL_12:
    result = std::unique_ptr<re::AudioTelemetryReporter,std::function<void ()(re::AudioTelemetryReporter*)>>::~unique_ptr[abi:ne180100](&v8);
    re::ecs2::AudioPlayerTelemetryReporter::sharedReporter = v2;
  }
  return result;
}

@end
