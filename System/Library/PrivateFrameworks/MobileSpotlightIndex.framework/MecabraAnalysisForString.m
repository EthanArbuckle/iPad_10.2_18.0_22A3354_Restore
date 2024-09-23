@implementation MecabraAnalysisForString

void *__MecabraAnalysisForString_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib/libmecabra.dylib", 1);
  MecabraAnalysisForString_mecabra_handle = (uint64_t)result;
  if (result)
  {
    result = dlsym(result, "MecabraCreateWithOptions");
    weak_MecabraCreateWithOptions = result;
    if (result)
    {
      result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraAnalyzeString");
      weak_MecabraAnalyzeString = result;
      if (result)
      {
        result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraCancelAnalysis");
        weak_MecabraCancelAnalysis = result;
        if (result)
        {
          result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraCancelAnalysis");
          weak_MecabraRelease = result;
          if (result)
          {
            result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraGetNextCandidate");
            weak_MecabraGetNextCandidate = result;
            if (result)
            {
              result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraCandidateGetAnalysisString");
              weak_MecabraCandidateGetAnalysisString = result;
              if (result)
              {
                result = dlsym((void *)MecabraAnalysisForString_mecabra_handle, "MecabraCandidateGetSurface");
                weak_MecabraCandidateGetSurface = result;
                if (result)
                  MecabraAnalysisForString_valid = 1;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

@end
