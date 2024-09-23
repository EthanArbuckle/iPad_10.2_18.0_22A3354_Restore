@implementation EARSpeechRecognitionAudioBuffer

uint64_t __55___EARSpeechRecognitionAudioBuffer_addAudioSampleData___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 40))
    return (*(uint64_t (**)(_QWORD, uint64_t, unint64_t))(**(_QWORD **)(*(_QWORD *)(result + 32) + 8)
                                                                        + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 8), objc_msgSend(objc_retainAutorelease(*(id *)(result + 40)), "bytes"), (unint64_t)objc_msgSend(*(id *)(result + 40), "length") >> 1);
  return result;
}

uint64_t __44___EARSpeechRecognitionAudioBuffer_endAudio__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  return result;
}

uint64_t __63___EARSpeechRecognitionAudioBuffer_triggerServerSideEndPointer__block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8));
  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  return result;
}

void __53___EARSpeechRecognitionAudioBuffer_cancelRecognition__block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "cancelRecognition");

}

uint64_t __53___EARSpeechRecognitionAudioBuffer_stopAudioDecoding__block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 56))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8));
  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  return result;
}

_QWORD *__57___EARSpeechRecognitionAudioBuffer__setUnderlyingBuffer___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8));
  return std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (uint64_t *)(a1 + 40));
}

double __57___EARSpeechRecognitionAudioBuffer_bufferedAudioDuration__block_invoke(uint64_t a1)
{
  double result;

  result = (*(float (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 64))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __57___EARSpeechRecognitionAudioBuffer_consumedAudioDuration__block_invoke(uint64_t a1)
{
  double result;

  result = (*(float (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 72))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __72___EARSpeechRecognitionAudioBuffer_packetArrivalTimestampFromAudioTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, float))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 80))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
