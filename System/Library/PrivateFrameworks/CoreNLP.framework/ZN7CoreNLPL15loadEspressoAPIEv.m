@implementation ZN7CoreNLPL15loadEspressoAPIEv

void *___ZN7CoreNLPL15loadEspressoAPIEv_block_invoke(CoreNLP *a1)
{
  void *result;
  void *v2;
  BOOL v3;
  char v12;

  result = (void *)CoreNLP::loadEspresso(a1);
  if (result)
  {
    v2 = result;
    CoreNLP::_espresso_create_context = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "espresso_create_context");
    CoreNLP::_espresso_context_destroy = (uint64_t (*)(void))dlsym(v2, "espresso_context_destroy");
    CoreNLP::_espresso_create_plan = (uint64_t (*)(void))dlsym(v2, "espresso_create_plan");
    CoreNLP::_espresso_plan_destroy = (uint64_t (*)(void))dlsym(v2, "espresso_plan_destroy");
    CoreNLP::_espresso_plan_add_network = (uint64_t (*)(void))dlsym(v2, "espresso_plan_add_network");
    CoreNLP::_espresso_plan_build = (uint64_t (*)(_QWORD))dlsym(v2, "espresso_plan_build");
    CoreNLP::_espresso_network_bind_buffer = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v2, "espresso_network_bind_buffer");
    CoreNLP::_espresso_plan_execute_sync = (uint64_t (*)(_QWORD))dlsym(v2, "espresso_plan_execute_sync");
    CoreNLP::_espresso_network_declare_output = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v2, "espresso_network_declare_output");
    result = dlsym(v2, "espresso_network_declare_input");
    CoreNLP::_espresso_network_declare_input = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
    if (CoreNLP::_espresso_create_context)
      v3 = CoreNLP::_espresso_context_destroy == 0;
    else
      v3 = 1;
    v12 = !v3
       && CoreNLP::_espresso_create_plan != 0
       && CoreNLP::_espresso_plan_destroy != 0
       && CoreNLP::_espresso_plan_add_network != 0
       && CoreNLP::_espresso_plan_build != 0
       && CoreNLP::_espresso_network_bind_buffer != 0
       && CoreNLP::_espresso_plan_execute_sync != 0
       && CoreNLP::_espresso_network_declare_output != 0
       && result != 0;
    CoreNLP::loadEspressoAPI(void)::isSoftlinked = v12;
  }
  return result;
}

@end
