@implementation MTLCommandQueue

uint64_t __40___MTLCommandQueue_submitCommandBuffer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_submitAvailableCommandBuffers");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_submitAvailableCommandBuffers");
}

uint64_t __39___MTLCommandQueue_setSubmissionQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_submitAvailableCommandBuffers");
}

uint64_t __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke_2()
{
  uint64_t result;

  result = MTLGetEnvDefault("METAL_FORCE_IMMEDIATE_SUBMISSION", initWithDevice_descriptor__force_immediate_submission_on_commit_thread);
  initWithDevice_descriptor__force_immediate_submission_on_commit_thread = result != 0;
  return result;
}

uint64_t __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didScheduleWithStartTime:endTime:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commandBufferDidComplete:startTime:completionTime:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48), 0);
}

@end
